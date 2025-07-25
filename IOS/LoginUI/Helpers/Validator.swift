//
//  Validator.swift
//  LoginUI
//
//  Created by Batuhan Berk Ertekin on 25.07.2025.
//

import Foundation

/// Provides static validation functions for email and password fields.
struct Validator {
    /// Validates email address using regex.
    /// - Parameter email: Email string to validate.
    /// - Returns: Boolean indicating if email is valid.
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    /// Validates password according to business rules.
    /// - Parameter password: Password string to validate.
    /// - Returns: Boolean indicating if password is valid.
    static func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,50}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
} 
