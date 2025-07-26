//
//  SignInViewModel.swift
//  LoginUI
//
//  Created by Batuhan Berk Ertekin on 23.07.2025.
//

import SwiftUI
import Foundation

// MARK: - SignInViewModelProtocol
/// Protocol defining the interface for SignInViewModel
protocol SignInViewModelProtocol {
    func login() async -> Bool
}

// MARK: - SignInViewModel
/// ViewModel responsible for handling user authentication and sign-in logic
@MainActor
final class SignInViewModel: ObservableObject, SignInViewModelProtocol {
    
    // MARK: - Published Properties (Form Inputs)
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isPasswordVisible: Bool = false

    // MARK: - Published Properties (State)
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String? = nil

    // MARK: - Private Properties
    private let authService: AuthServiceProtocol

    // MARK: - Init
    /// Initializes the view model with an auth service dependency.
    /// - Parameter authService: The auth service to use (must be provided explicitly).
    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }

    // MARK: - Authentication Logic
    /// Performs user authentication with username and password
    /// - Returns: Boolean indicating login success
    func login() async -> Bool {
        // Input validation
        guard !email.isEmpty else {
            errorMessage = "Please enter e-mail"
            return false
        }

        guard !password.isEmpty else {
            errorMessage = "Please enter password"
            return false
        }

        isLoading = true
        errorMessage = nil

        do {
            let _ = try await authService.login(email: email, password: password)
            isLoading = false
            return true
        } catch let authError as AuthError {
            switch authError {
            case .serverError(let message):
                errorMessage = message
            default:
                errorMessage = authError.errorDescription
            }
            isLoading = false
            return false
        } catch {
            print("Auth error: \(error.localizedDescription)")
            errorMessage = "Login failed. Please try again."
            isLoading = false
            return false
        }
    }
}
