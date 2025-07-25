//
//  SignUpViewModel.swift
//  LoginUI
//
//  Created by Batuhan Berk Ertekin on 23.07.2025.
//

import SwiftUI

/// ViewModel responsible for handling user registration and sign-up logic
@MainActor
final class SignUpViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isPasswordVisible: Bool = false
    @Published var isConfirmPasswordVisible: Bool = false
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String? = nil
    @Published var isWaitingForVerification: Bool = false
    @Published var isEmailVerified: Bool = false
    @Published var registrationSuccess: Bool = false
    private var verificationTask: Task<Void, Never>? = nil
    
    // MARK: - Private Properties
    
    /// Network service instance for API requests (protocol)
    private let authService: AuthServiceProtocol
    
    /// Initializes the view model with an auth service dependency.
    /// - Parameter authService: The auth service to use (must be provided explicitly).
    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }
    
    // MARK: - Private Methods
    
    // Email and password validation are now handled by ValidationUtils
    
    // MARK: - Public Methods
    
    /// Performs user registration with validation
    /// - Returns: Boolean indicating registration success
    func register() async -> Bool {
        // E-mail validation
        guard Validator.isValidEmail(email) else {
            errorMessage = AuthError.invalidEmail.errorDescription
            registrationSuccess = false
            return false
        }
        
        // Password validation
        guard Validator.isValidPassword(password) else {
            errorMessage = AuthError.invalidPassword.errorDescription
            registrationSuccess = false
            return false
        }
        
        // Password confirmation
        guard password == confirmPassword else {
            errorMessage = AuthError.passwordsDoNotMatch.errorDescription
            registrationSuccess = false
            return false
        }
        
        isLoading = true
        errorMessage = nil
        registrationSuccess = false
        
        do {
            let response = try await authService.register(email: email, password: password)
            registrationSuccess = true
            if let message = response.message {
                print(message)
            }
            isLoading = false
            return true
        } catch let authError as AuthError {
            print("Auth error: \(authError.localizedDescription)")
            switch authError {
            case .serverError(let message):
                errorMessage = message
            default:
                errorMessage = authError.errorDescription
            }
            registrationSuccess = false
            isLoading = false
            return false
        } catch {
            print("Auth error: \(error.localizedDescription)")
            errorMessage = AuthError.unknown.errorDescription
            registrationSuccess = false
            isLoading = false
            return false
        }
    }
    
    /// Starts polling the backend to check if the user's email has been verified.
    /// This function launches a background task that checks the email verification status every 2 seconds.
    /// When the email is verified, polling stops and the UI can react (e.g., navigate to Home).
    func startEmailVerificationPolling() {
        isWaitingForVerification = true
        isEmailVerified = false
        verificationTask?.cancel()
        verificationTask = Task {
            while !Task.isCancelled {
                do {
                    let response = try await authService.checkEmailStatus(email: email)
                    if response.isEmailVerified {
                        isEmailVerified = true
                        isWaitingForVerification = false
                        break
                    }
                } catch {
                    
                }
                try? await Task.sleep(nanoseconds: 2_000_000_000)
            }
        }
    }
    
    /// One-time manual email verification check
    @MainActor
    func checkEmailStatusManually() async {
        do {
            let response = try await authService.checkEmailStatus(email: email)
            if response.isEmailVerified {
                isEmailVerified = true
                isWaitingForVerification = false
            }
        } catch {
        }
    }
    /// Stops the email verification polling task and resets waiting state.
    func stopEmailVerificationPolling() {
        verificationTask?.cancel()
        isWaitingForVerification = false
    }
} 
