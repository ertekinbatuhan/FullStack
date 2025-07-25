//
//  NetworkManager.swift
//  LoginUI
//
//  Created by Batuhan Berk Ertekin on 23.07.2025.
//

import Foundation

// MARK: - NetworkManagerProtocol
protocol NetworkManagerProtocol {
    func requestData<T: Decodable, U: Encodable>(
        path: URL,
        type: T.Type,
        body: U
    ) async throws -> T
}

// MARK: - Network Manager Implementation
/// Handles network requests and decodes the received data into the specified model type.
final class NetworkManager: NetworkManagerProtocol {
    
    // MARK: - Request Data Method
    /// Fetches data from the specified network path and decodes it into the specified type.
    /// - Parameters:
    ///   - path: The network path (URL) to fetch data from.
    ///   - type: The type to decode the data into, which must conform to `Decodable`.
    /// - Returns: The decoded data of type `T`.
    /// - Throws: An error if the request fails or if the data cannot be decoded.
    func requestData<T: Decodable, U: Encodable>(
        path: URL,
        type: T.Type,
        body: U
    ) async throws -> T {
        var request = URLRequest(url: path)
        request.httpMethod = HTTPMethod.POST.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw AuthError.invalidServerResponse
        }
        if !(200...299).contains(httpResponse.statusCode) {
            if let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                throw AuthError.serverError(errorResponse.message)
            } else {
                throw AuthError.invalidServerResponse
            }
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw AuthError.decodingError(error)
        }
    }

}
