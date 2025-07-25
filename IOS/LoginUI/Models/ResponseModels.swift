//
//  ResponseModels.swift
//  LoginUI
//
//  Created by Batuhan Berk Ertekin on 23.07.2025.
//

import Foundation

// MARK: - Request Models
struct LoginRequest: Encodable {
    let email: String
    let password: String
}

struct RegisterRequest: Encodable {
    let email: String
    let password: String
}

// MARK: - Response Models
struct LoginResponse: Decodable {
    let token: String
}

struct RegisterResponse: Decodable {
    let token: String?
    let message: String?
}

// MARK: - Error Models
struct ErrorResponse: Decodable {
    let message: String
}

// MARK: - Email Status Models
struct EmailStatusRequest: Encodable {
    let email: String
}

struct EmailStatusResponse: Decodable {
    let email: String
    let isRegistered: Bool
    let isEmailVerified: Bool
    let status: String
    let message: String
    let registrationDate: String?
}

// MARK: - Forgot/Reset Password Models
struct ForgotPasswordRequest: Encodable {
    let email: String
}

struct ResetPasswordRequest: Encodable {
    let token: String
    let newPassword: String
}

struct ForgotPasswordResponse: Decodable {
    let message: String
}

struct ResetPasswordResponse: Decodable {
    let message: String
}
