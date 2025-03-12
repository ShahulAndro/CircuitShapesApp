//
//  NetworkError.swift
//  CircuitShapesApp
//
//  Created by Shahul Hameed Shaik on 11/03/2025.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case networkUnavailable
    case invalidURL
    case decodingFailed
    case noData
    case reesponseFailed
    case apiError(Int, String)
    case timeout
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .networkUnavailable:
            return "Network Unavailable"
        case .invalidURL:
            return "Invalid URL"
        case .decodingFailed:
            return "Decoding failed"
        case .noData:
            return "No data returned"
        case .reesponseFailed:
            return "Response failed, please try again later"
        case .apiError(let statusCode, let Message):
            return "API Error (\(statusCode), message: \(Message))"
        case .timeout:
            return "Timeout, please try again later"
        case .unknown:
            return "Unknown error"
        }
    }
}
