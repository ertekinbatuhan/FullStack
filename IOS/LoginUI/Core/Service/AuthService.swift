//
//  AuthService.swift
//  LoginUI
//
//  Created by Batuhan Berk Ertekin on 23.07.2025.
//

import Foundation

// MARK: - AuthServiceProtocol
/// Protocol defining authentication-related network operations.
protocol AuthServiceProtocol {
    /// Performs user login with the given e-mail and password.
    /// - Parameters:
    ///   - email: The e-mail of the user.
    ///   - password: The password of the user.
    /// - Returns: A LoginResponse object containing authentication data.
    /// - Throws: An error if the request fails or the response cannot be decoded.
    func login(email: String, password: String) async throws -> LoginResponse
    
    /// Registers a new user with the given e-mail and password.
    /// - Parameters:
    ///   - email: The e-mail for the new user.
    ///   - password: The password for the new user.
    /// - Returns: A RegisterResponse object containing registration data.
    /// - Throws: An error if the request fails or the response cannot be decoded.
    func register(email: String, password: String) async throws -> RegisterResponse
    
    /// Checks the status of an email (registered, verified, etc.)
    /// - Parameter email: The email to check
    /// - Returns: An EmailStatusResponse object containing status data
    /// - Throws: An error if the request fails or the response cannot be decoded.
    func checkEmailStatus(email: String) async throws -> EmailStatusResponse
}

// MARK: - AuthService
/// Service responsible for handling authentication-related API requests.
final class AuthService: AuthServiceProtocol {
    /// The network manager used to perform network requests.
    private let networkManager: NetworkManagerProtocol
    
    /// Initializes the AuthService with a network manager dependency.
    /// - Parameter networkManager: The network manager to use for requests.
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    /// Performs user login by sending a request to the login endpoint.
    /// - Parameters:
    ///   - email: The e-mail of the user.
    ///   - password: The password of the user.
    /// - Returns: A LoginResponse object containing authentication data.
    /// - Throws: An error if the URL is invalid, the request fails, or the response cannot be decoded.
    func login(email: String, password: String) async throws -> LoginResponse {
        guard let url = URL(string: APIConstants.Endpoints.login) else {
            throw AuthError.invalidURL
        }
        let requestModel = LoginRequest(email: email, password: password)
        return try await networkManager.requestData(path: url, type: LoginResponse.self, body: requestModel)
    }
    
    /// Registers a new user by sending a request to the register endpoint.
    /// - Parameters:
    ///   - email: The e-mail for the new user.
    ///   - password: The password for the new user.
    /// - Returns: A RegisterResponse object containing registration data.
    /// - Throws: An error if the URL is invalid, the request fails, or the response cannot be decoded.
    func register(email: String, password: String) async throws -> RegisterResponse {
        guard let url = URL(string: APIConstants.Endpoints.register) else {
            throw AuthError.invalidURL
        }
        let requestModel = RegisterRequest(email: email, password: password)
        return try await networkManager.requestData(path: url, type: RegisterResponse.self, body: requestModel)
    }
    
    /// Checks the status of an email (registered, verified, etc.)
    func checkEmailStatus(email: String) async throws -> EmailStatusResponse {
        guard let url = URL(string: APIConstants.Endpoints.checkEmailStatus) else {
            throw AuthError.invalidURL
        }
        let requestModel = EmailStatusRequest(email: email)
        return try await networkManager.requestData(path: url, type: EmailStatusResponse.self, body: requestModel)
    }

    /// Sends a forgot password request to the forgot-password endpoint.
    func forgotPassword(email: String) async throws -> ForgotPasswordResponse {
        guard let url = URL(string: APIConstants.Endpoints.forgotPassword) else {
            throw AuthError.invalidURL
        }
        let requestModel = ForgotPasswordRequest(email: email)
        return try await networkManager.requestData(path: url, type: ForgotPasswordResponse.self, body: requestModel)
    }

    /// Sends a reset password request to the reset-password endpoint.
    func resetPassword(token: String, newPassword: String) async throws -> ResetPasswordResponse {
        guard let url = URL(string: APIConstants.Endpoints.resetPassword) else {
            throw AuthError.invalidURL
        }
        let requestModel = ResetPasswordRequest(token: token, newPassword: newPassword)
        return try await networkManager.requestData(path: url, type: ResetPasswordResponse.self, body: requestModel)
    }
} 
