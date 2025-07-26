//
//  AuthError.swift
//  LoginUI
//
//  Created by Batuhan Berk Ertekin on 23.07.2025.
//

import Foundation

// MARK: - AuthError
/// Authentication related error cases
enum AuthError: Error, LocalizedError {
    
    // MARK: Error Cases
    case invalidURL
    case decodingError(Error)
    case passwordsDoNotMatch
    case invalidEmail
    case invalidPassword
    case invalidRequestBody
    case invalidServerResponse
    case unauthorized
    case serverError(String)
    case unknown
    
    // MARK: LocalizedError
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .decodingError(let error):
            return "Decoding error: \(error.localizedDescription)"
        case .passwordsDoNotMatch:
            return "Passwords do not match."
        case .invalidEmail:
            return "Please enter a valid email address."
        case .invalidPassword:
            return "Password must be at least 8 characters and include an uppercase letter, a lowercase letter, a number, and a special character (@$!%*?&)."
        case .invalidRequestBody:
            return "Invalid request body."
        case .invalidServerResponse:
            return "Invalid server response."
        case .unauthorized:
            return "Invalid username or password."
        case .serverError(let message):
            return message
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
