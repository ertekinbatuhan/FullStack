//
//  AuthEndpoint.swift
//  LoginUI
//
//  Created by Batuhan Berk Ertekin on 23.07.2025.
//

import Foundation

// MARK: - APIConstants
/// API configuration constants
struct APIConstants {
    
    // MARK: Base URL
    static let baseURL = "https://login-auth-api-azgnaec5ahavgths.westeurope-01.azurewebsites.net/api"
    
    // MARK: Endpoints
    struct Endpoints {
        static let login = "\(baseURL)/auth/login"
        static let register = "\(baseURL)/auth/register"
        static let checkEmailStatus = "\(baseURL)/auth/check-email-status"
        static let forgotPassword = "\(baseURL)/auth/forgot-password"
        static let resetPassword = "\(baseURL)/auth/reset-password"
    }
    
    // MARK: Headers
    struct Headers {
        static let contentType = "Content-Type"
        static let applicationJSON = "application/json"
    }
}
