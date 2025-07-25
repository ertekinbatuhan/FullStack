//
//  SignUpView.swift
//  LoginUI
//
//  Created by Batuhan Berk Ertekin on 23.07.2025.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject private var viewModel = SignUpViewModel(authService: AuthService(networkManager: NetworkManager()))
    @Environment(\.presentationMode) var presentationMode
    @State private var isRegistered = false
    @State private var showEmailVerificationView = false
    @State private var isEmailVerified = false
    
    var body: some View {
        ZStack {
            content
            if viewModel.isLoading {
                Color.black.opacity(0.2).ignoresSafeArea()
                ProgressView()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $showEmailVerificationView) {
            EmailVerificationView(email: viewModel.email, viewModel: viewModel, isEmailVerified: $isEmailVerified)
        }
        .navigationDestination(isPresented: $isEmailVerified) {
            HomeView()
        }
    }
    
    @ViewBuilder
    private var content: some View {
        ZStack {
            background
            mainVStack
        }
    }
    @ViewBuilder
    private var background: some View {
        LinearGradient(gradient: Gradient(colors: [
            Color(red: 1, green: 0.93, blue: 0.92),
            Color(red: 0.91, green: 0.93, blue: 1)
        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
    @ViewBuilder
    private var mainVStack: some View {
        VStack(spacing: 24) {
            Spacer().frame(height: 24)
            titleSection
            formSection
            registerButton
            Spacer()
            signInSection
        }
        .padding(.horizontal, 24)
    }
    @ViewBuilder
    private var titleSection: some View {
        VStack(spacing: 4) {
            Text("Create Account")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.blue)
        }
    }
    @ViewBuilder
    private var formSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("E-mail")
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.gray)
            TextField("E-mail", text: $viewModel.email)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                .autocapitalization(.none)
            Text("Password")
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.gray)
            HStack {
                if viewModel.isPasswordVisible {
                    TextField("Password", text: $viewModel.password)
                        .autocapitalization(.none)
                } else {
                    SecureField("Password", text: $viewModel.password)
                }
                Button(action: { viewModel.isPasswordVisible.toggle() }) {
                    Image(systemName: viewModel.isPasswordVisible ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).stroke(Color.gray.opacity(0.3), lineWidth: 1))
            Text("Confirm Password")
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.gray)
            HStack {
                if viewModel.isConfirmPasswordVisible {
                    TextField("Confirm Password", text: $viewModel.confirmPassword)
                        .autocapitalization(.none)
                } else {
                    SecureField("Confirm Password", text: $viewModel.confirmPassword)
                }
                Button(action: { viewModel.isConfirmPasswordVisible.toggle() }) {
                    Image(systemName: viewModel.isConfirmPasswordVisible ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).stroke(Color.gray.opacity(0.3), lineWidth: 1))
        }
    }
    @ViewBuilder
    private var registerButton: some View {
        Button(action: {
            print("Register button tapped")
            Task {
                let success = await viewModel.register()
                print("Register completion called with success: \(success)")
                if success {
                    print("Setting showEmailVerificationView to true")
                    showEmailVerificationView = true
                } else {
                    print("Registration failed")
                }
            }
        }) {
            Text("Sign Up")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
        }
        .padding(.top, 8)
        .disabled(viewModel.isLoading)
        
        if let errorMessage = viewModel.errorMessage, !errorMessage.isEmpty {
            ErrorMessageView(message: errorMessage)
        }
    }
    @ViewBuilder
    private var signInSection: some View {
        HStack {
            Text("Already have an account?")
                .foregroundColor(.gray)
                .font(.system(size: 14))
            Button(action: { presentationMode.wrappedValue.dismiss() }) {
                Text("Sign In")
                    .foregroundColor(Color.blue)
                    .font(.system(size: 14, weight: .bold))
            }
        }
        .padding(.bottom, 16)
    }
}

#Preview {
    SignUpView()
} 
