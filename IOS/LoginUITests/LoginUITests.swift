//
//  LoginUITests.swift
//  LoginUITests
//
//  Created by Batuhan Berk Ertekin on 26.07.2025.
//

import XCTest
@testable import LoginUI

final class LoginUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}

// MARK: - Mock Classes
class MockNetworkManager: NetworkManagerProtocol {
    var shouldThrowError = false
    var errorToThrow: Error = AuthError.unknown
    var mockResponse: Any?
    
    func requestData<T: Decodable, U: Encodable>(path: URL, type: T.Type, body: U) async throws -> T {
        if shouldThrowError {
            throw errorToThrow
        }
        
        guard let response = mockResponse as? T else {
            throw AuthError.decodingError(NSError(domain: "MockError", code: 0))
        }
        
        return response
    }
}

// MARK: - AuthError Extension for Testing
extension AuthError: Equatable {
    public static func == (lhs: AuthError, rhs: AuthError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidURL, .invalidURL),
             (.passwordsDoNotMatch, .passwordsDoNotMatch),
             (.invalidEmail, .invalidEmail),
             (.invalidPassword, .invalidPassword),
             (.invalidRequestBody, .invalidRequestBody),
             (.invalidServerResponse, .invalidServerResponse),
             (.unauthorized, .unauthorized),
             (.unknown, .unknown):
            return true
        case (.decodingError(let lhsError), .decodingError(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        case (.serverError(let lhsMessage), .serverError(let rhsMessage)):
            return lhsMessage == rhsMessage
        default:
            return false
        }
    }
}


// MARK: - AuthService Tests
extension LoginUITests {
    
    func testAuthServiceLoginSuccess() async {
        // Given
        let mockNetworkManager = MockNetworkManager()
        let expectedResponse = LoginResponse(token: "test-token-123")
        mockNetworkManager.mockResponse = expectedResponse
        let authService = AuthService(networkManager: mockNetworkManager)
        
        // When
        do {
            let response = try await authService.login(email: "batuhanertekinn@gmail.com", password: "Password123!")
            
            // Then
            XCTAssertEqual(response.token, "test-token-123")
        } catch {
            XCTFail("Login should succeed but threw error: \(error)")
        }
    }
    
    func testAuthServiceLoginFailure() async {
        // Given
        let mockNetworkManager = MockNetworkManager()
        mockNetworkManager.shouldThrowError = true
        mockNetworkManager.errorToThrow = AuthError.unauthorized
        let authService = AuthService(networkManager: mockNetworkManager)
        
        // When
        do {
            let _ = try await authService.login(email: "batuhanertekinn@gmail.com", password: "WrongPassword")
            XCTFail("Login should fail but succeeded")
        } catch let error as AuthError {
            // Then
            XCTAssertEqual(error, AuthError.unauthorized)
        } catch {
            XCTFail("Unexpected error type: \(error)")
        }
    }
    
    func testAuthServiceRegisterSuccess() async {
        // Given
        let mockNetworkManager = MockNetworkManager()
        let expectedResponse = RegisterResponse(token: "register-token-123", message: "Registration successful")
        mockNetworkManager.mockResponse = expectedResponse
        let authService = AuthService(networkManager: mockNetworkManager)
        
        // When
        do {
            let response = try await authService.register(email: "batuhanertekinn@gmail.com", password: "Password123!")
            
            // Then
            XCTAssertEqual(response.token, "register-token-123")
            XCTAssertEqual(response.message, "Registration successful")
        } catch {
            XCTFail("Registration should succeed but threw error: \(error)")
        }
    }
    
    func testAuthServiceForgotPasswordSuccess() async {
        // Given
        let mockNetworkManager = MockNetworkManager()
        let expectedResponse = ForgotPasswordResponse(message: "Reset link sent to your email")
        mockNetworkManager.mockResponse = expectedResponse
        let authService = AuthService(networkManager: mockNetworkManager)
        
        // When
        do {
            let response = try await authService.forgotPassword(email: "batuhanertekinn@gmail.com")
            
            // Then
            XCTAssertEqual(response.message, "Reset link sent to your email")
        } catch {
            XCTFail("Forgot password should succeed but threw error: \(error)")
        }
    }
    
    func testAuthServiceResetPasswordSuccess() async {
        // Given
        let mockNetworkManager = MockNetworkManager()
        let expectedResponse = ResetPasswordResponse(message: "Password reset successful")
        mockNetworkManager.mockResponse = expectedResponse
        let authService = AuthService(networkManager: mockNetworkManager)
        
        // When
        do {
            let response = try await authService.resetPassword(token: "reset-token-123", newPassword: "NewPassword123!")
            
            // Then
            XCTAssertEqual(response.message, "Password reset successful")
        } catch {
            XCTFail("Reset password should succeed but threw error: \(error)")
        }
    }
    
    func testAuthServiceCheckEmailStatusSuccess() async {
        // Given
        let mockNetworkManager = MockNetworkManager()
        let expectedResponse = EmailStatusResponse(
            email: "batuhanertekinn@gmail.com",
            isRegistered: true,
            isEmailVerified: false,
            status: "registered",
            message: "Email is registered but not verified",
            registrationDate: "2025-07-26"
        )
        mockNetworkManager.mockResponse = expectedResponse
        let authService = AuthService(networkManager: mockNetworkManager)
        
        // When
        do {
            let response = try await authService.checkEmailStatus(email: "batuhanertekinn@gmail.com")
            
            // Then
            XCTAssertEqual(response.email, "batuhanertekinn@gmail.com")
            XCTAssertTrue(response.isRegistered)
            XCTAssertFalse(response.isEmailVerified)
            XCTAssertEqual(response.status, "registered")
            XCTAssertEqual(response.message, "Email is registered but not verified")
        } catch {
            XCTFail("Check email status should succeed but threw error: \(error)")
        }
    }
    

}

// MARK: - SignInViewModel Tests
extension LoginUITests {
    
    @MainActor
    func testSignInViewModelSuccessfulLogin() async {
        // Given
        let mockNetworkManager = MockNetworkManager()
        let expectedResponse = LoginResponse(token: "success-token")
        mockNetworkManager.mockResponse = expectedResponse
        let authService = AuthService(networkManager: mockNetworkManager)
        let viewModel = SignInViewModel(authService: authService)
        viewModel.email = "batuhanertekinn@gmail.com"
        viewModel.password = "Password123!"
        
        // When
        let success = await viewModel.login()
        
        // Then
        XCTAssertTrue(success)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    @MainActor
    func testSignInViewModelFailedLogin() async {
        // Given
        let mockNetworkManager = MockNetworkManager()
        mockNetworkManager.shouldThrowError = true
        mockNetworkManager.errorToThrow = AuthError.unauthorized
        let authService = AuthService(networkManager: mockNetworkManager)
        let viewModel = SignInViewModel(authService: authService)
        viewModel.email = "batuhanertekinn@gmail.com"
        viewModel.password = "WrongPassword"
        
        // When
        let success = await viewModel.login()
        
        // Then
        XCTAssertFalse(success)
        XCTAssertEqual(viewModel.errorMessage, "Invalid username or password.")
        XCTAssertFalse(viewModel.isLoading)
    }
    
    @MainActor
    func testSignInViewModelEmptyEmail() async {
        // Given
        let mockNetworkManager = MockNetworkManager()
        let authService = AuthService(networkManager: mockNetworkManager)
        let viewModel = SignInViewModel(authService: authService)
        viewModel.email = ""
        viewModel.password = "Password123!"
        
        // When
        let success = await viewModel.login()
        
        // Then
        XCTAssertFalse(success)
        XCTAssertEqual(viewModel.errorMessage, "Please enter e-mail")
        XCTAssertFalse(viewModel.isLoading)
    }
    
    @MainActor
    func testSignInViewModelEmptyPassword() async {
        // Given
        let mockNetworkManager = MockNetworkManager()
        let authService = AuthService(networkManager: mockNetworkManager)
        let viewModel = SignInViewModel(authService: authService)
        viewModel.email = "batuhanertekinn@gmail.com"
        viewModel.password = ""
        
        // When
        let success = await viewModel.login()
        
        // Then
        XCTAssertFalse(success)
        XCTAssertEqual(viewModel.errorMessage, "Please enter password")
        XCTAssertFalse(viewModel.isLoading)
    }
}

// MARK: - SignUpViewModel Tests
extension LoginUITests {
    
    @MainActor
    func testSignUpViewModelSuccessfulRegistration() async {
        // Given
        let mockNetworkManager = MockNetworkManager()
        let expectedResponse = RegisterResponse(token: "register-token", message: "Registration successful")
        mockNetworkManager.mockResponse = expectedResponse
        let authService = AuthService(networkManager: mockNetworkManager)
        let viewModel = SignUpViewModel(authService: authService)
        viewModel.email = "batuhanertekinn@gmail.com"
        viewModel.password = "Password123!"
        viewModel.confirmPassword = "Password123!"
        
        // When
        let success = await viewModel.register()
        
        // Then
        XCTAssertTrue(success)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    @MainActor
    func testSignUpViewModelPasswordMismatch() async {
        // Given
        let mockNetworkManager = MockNetworkManager()
        let authService = AuthService(networkManager: mockNetworkManager)
        let viewModel = SignUpViewModel(authService: authService)
        viewModel.email = "batuhanertekinn@gmail.com"
        viewModel.password = "Password123!"
        viewModel.confirmPassword = "DifferentPassword123!"
        
        // When
        let success = await viewModel.register()
        
        // Then
        XCTAssertFalse(success)
        XCTAssertEqual(viewModel.errorMessage, "Passwords do not match.")
        XCTAssertFalse(viewModel.isLoading)
    }
    
    @MainActor
    func testSignUpViewModelInvalidEmail() async {
        // Given
        let mockNetworkManager = MockNetworkManager()
        let authService = AuthService(networkManager: mockNetworkManager)
        let viewModel = SignUpViewModel(authService: authService)
        viewModel.email = "invalid-email"
        viewModel.password = "Password123!"
        viewModel.confirmPassword = "Password123!"
        
        // When
        let success = await viewModel.register()
        
        // Then
        XCTAssertFalse(success)
        XCTAssertEqual(viewModel.errorMessage, "Please enter a valid email address.")
        XCTAssertFalse(viewModel.isLoading)
    }
    
    @MainActor
    func testSignUpViewModelInvalidPassword() async {
        // Given
        let mockNetworkManager = MockNetworkManager()
        let authService = AuthService(networkManager: mockNetworkManager)
        let viewModel = SignUpViewModel(authService: authService)
        viewModel.email = "batuhanertekinn@gmail.com"
        viewModel.password = "weak"
        viewModel.confirmPassword = "weak"
        
        // When
        let success = await viewModel.register()
        
        // Then
        XCTAssertFalse(success)
        XCTAssertEqual(viewModel.errorMessage, "Password must be at least 8 characters and include an uppercase letter, a lowercase letter, a number, and a special character (@$!%*?&).")
        XCTAssertFalse(viewModel.isLoading)
    }
    
    @MainActor
    func testSignUpViewModelEmptyEmail() async {
        // Given
        let mockNetworkManager = MockNetworkManager()
        let authService = AuthService(networkManager: mockNetworkManager)
        let viewModel = SignUpViewModel(authService: authService)
        viewModel.email = ""
        viewModel.password = "Password123!"
        viewModel.confirmPassword = "Password123!"
        
        // When
        let success = await viewModel.register()
        
        // Then
        XCTAssertFalse(success)
        XCTAssertEqual(viewModel.errorMessage, "Please enter a valid email address.")
        XCTAssertFalse(viewModel.isLoading)
    }
}


