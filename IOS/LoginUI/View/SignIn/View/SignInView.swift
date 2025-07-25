//
//  SignInView.swift
//  LoginUI
//
//  Created by Batuhan Berk Ertekin on 23.07.2025.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject private var viewModel = SignInViewModel(authService: AuthService(networkManager: NetworkManager()))
    @State private var isLoggedIn = false
    @State private var showForgotPassword = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                content
                if viewModel.isLoading {
                    Color.black.opacity(0.2).ignoresSafeArea()
                    ProgressView()
                }
            }
            .navigationDestination(isPresented: $isLoggedIn) {
                HomeView()
            }
            .navigationBarBackButtonHidden(true)
            .sheet(isPresented: $showForgotPassword) {
                ForgotPasswordView()
            }
        }
    }
    
    @ViewBuilder
    private var content: some View {
        ZStack {
            gradientBackground
            mainVStack
        }
    }
    
    @ViewBuilder
    private var gradientBackground: some View {
        LinearGradient(gradient: Gradient(colors: [
            Color(red: 1, green: 0.93, blue: 0.92),
            Color(red: 0.91, green: 0.93, blue: 1)
        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
    
    @ViewBuilder
    private var mainVStack: some View {
        VStack(spacing: 32) {
            Spacer().frame(height: 64)
            titleSection
            Spacer().frame(height: 16)
            formSection
            forgotPasswordButton
            loginButton
            Spacer()
            signUpSection
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    @ViewBuilder
    private var titleSection: some View {
        VStack(spacing: 4) {
            Text("Sign In")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, alignment: .center)
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
        }
    }
    
    @ViewBuilder
    private var forgotPasswordButton: some View {
        HStack {
            Spacer()
            Button(action: {
                showForgotPassword = true
            }) {
                Text("Forgot Password?")
                    .foregroundColor(.blue)
                    .font(.footnote)
                    .padding(.top, 8)
            }
        }
    }
    
    @ViewBuilder
    private var signUpSection: some View {
        HStack {
            Text("Don’t have an account?")
                .foregroundColor(.gray)
                .font(.system(size: 14))
            NavigationLink(destination: SignUpView()) {
                Text("Sign Up")
                    .foregroundColor(Color.blue)
                    .font(.system(size: 14, weight: .bold))
            }
        }
        .padding(.bottom, 16)
    }
    
    @ViewBuilder
    private var loginButton: some View {
        Button(action: {
            Task {
                let success = await viewModel.login()
                if success {
                    isLoggedIn = true
                } else {
                }
            }
        }) {
            Text("Sign In")
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
}

#Preview {
    SignInView()
} 
