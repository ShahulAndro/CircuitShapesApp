//
//  NetworkManager.swift
//  CircuitShapesApp
//
//  Created by Shahul Hameed Shaik on 11/03/2025.
//

import Foundation

struct NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData<T: Decodable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                throw NetworkError
                    .apiError(httpResponse.statusCode, httpResponse.description)
            }
            
            do {
                let responseData = try JSONDecoder().decode(T.self, from: data)
                return responseData
            } catch {
                throw NetworkError.decodingFailed
            }
            
        } catch {
            guard let urlError = error as? URLError else {
                throw NetworkError.unknown
            }
            
            if urlError.code == .notConnectedToInternet {
                throw NetworkError.networkUnavailable
            } else if urlError.code == .timedOut {
                throw NetworkError.timeout
            } else {
                throw NetworkError.apiError(urlError.errorCode, urlError.localizedDescription)
            }
        }
        
    }
}
