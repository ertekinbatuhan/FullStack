//
//  ForgotPasswordView.swift
//  LoginUI
//
//  Created by Batuhan Berk Ertekin on 25.07.2025.
//


import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @State private var isLoading: Bool = false
    @State private var message: String?
    @State private var error: String?
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                titleSection
                emailInputSection
                messageSection
                buttonSection
                Spacer()
            }
            .padding()
            .navigationBarTitle("Forgot Password", displayMode: .inline)
            .navigationBarItems(leading: Button("Close") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    @ViewBuilder
    private var titleSection: some View {
        Text("Reset your password")
            .font(.title2)
            .fontWeight(.bold)
            .padding(.top, 32)
    }
    
    @ViewBuilder
    private var emailInputSection: some View {
        TextField("Email address", text: $email)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
    }
    
    @ViewBuilder
    private var messageSection: some View {
        if let message = message {
            Text(message)
                .foregroundColor(.green)
                .multilineTextAlignment(.center)
        }
        if let error = error {
            Text(error)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
        }
    }
    
    @ViewBuilder
    private var buttonSection: some View {
        Button(action: sendResetMail) {
            if isLoading {
                ProgressView()
            } else {
                Text("Send reset link")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .disabled(isLoading || email.isEmpty)
    }
    
    func sendResetMail() {
        isLoading = true
        message = nil
        error = nil
        Task {
            do {
                let response = try await AuthService(networkManager: NetworkManager()).forgotPassword(email: email)
                message = response.message
            } catch {
                self.error = error.localizedDescription
            }
            isLoading = false
        }
    }
}


