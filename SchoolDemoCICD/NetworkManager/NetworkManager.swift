//
//  NetworkManager.swift
//  SchoolDemoCICD
//
//  Created by Anand Yadav on 02/08/25.
//

import Foundation

enum SchoolError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidData
    case unknown(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "The server response was invalid"
        case .invalidData:
            return "The data couldn't be decoded"
        case .unknown(let error):
            return "Unknown error: \(error.localizedDescription)"
        }
    }
}

protocol NetworkServiceProtocol {
    func request<T:Decodable>(url:URL) async throws -> T
}

class NetworkManager:NetworkServiceProtocol {
    func request<T:Decodable>(url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
            throw SchoolError.invalidResponse
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw SchoolError.invalidData
        }
    }
}
