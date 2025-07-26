//
//  SignUpViewModel.swift
//  LoginUI
//
//  Created by Batuhan Berk Ertekin on 23.07.2025.
//

import SwiftUI

// MARK: - SignUpViewModelProtocol
/// Protocol defining the actions for SignUpViewModel
@MainActor
protocol SignUpViewModelProtocol {
    func register() async -> Bool
    func startEmailVerificationPolling()
    func checkEmailStatusManually() async
    func stopEmailVerificationPolling()
}
// MARK: - SignUpViewModel
/// ViewModel responsible for handling user registration and sign-up logic
@MainActor
final class SignUpViewModel: ObservableObject, SignUpViewModelProtocol {
    
    // MARK: - Published Properties (Form Inputs & States)
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isPasswordVisible: Bool = false
    @Published var isConfirmPasswordVisible: Bool = false
    @Published var isWaitingForVerification: Bool = false
    @Published var isEmailVerified: Bool = false
    @Published var registrationSuccess: Bool = false

    // MARK: - Published Properties (Read-Only States)
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String? = nil

    // MARK: - Private Properties
    private var verificationTask: Task<Void, Never>? = nil
    private let authService: AuthServiceProtocol

    // MARK: - Init
    /// Initializes the view model with an auth service dependency.
    /// - Parameter authService: The auth service to use (must be provided explicitly).
    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }

    // MARK: - Registration Logic
    /// Performs user registration with validation
    /// - Returns: Boolean indicating registration success
    func register() async -> Bool {
        guard Validator.isValidEmail(email) else {
            errorMessage = AuthError.invalidEmail.errorDescription
            registrationSuccess = false
            return false
        }

        guard Validator.isValidPassword(password) else {
            errorMessage = AuthError.invalidPassword.errorDescription
            registrationSuccess = false
            return false
        }

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

    // MARK: - Email Verification Polling
    
    /// Starts polling the backend to check if the user's email has been verified.
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
                    // Silent catch — optionally log
                }
                try? await Task.sleep(nanoseconds: 2_000_000_000)
            }
        }
    }

    /// One-time manual email verification check
    func checkEmailStatusManually() async {
        do {
            let response = try await authService.checkEmailStatus(email: email)
            if response.isEmailVerified {
                isEmailVerified = true
                isWaitingForVerification = false
            }
        } catch {
            // Silent catch — optionally log
        }
    }

    /// Stops the email verification polling task and resets waiting state.
    func stopEmailVerificationPolling() {
        verificationTask?.cancel()
        isWaitingForVerification = false
    }
}
