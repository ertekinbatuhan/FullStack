//
//  EmailVerificationView.swift
//  LoginUI
//
//  Created by Batuhan Berk Ertekin on 25.07.2025.
//

import SwiftUI

struct EmailVerificationView: View {
    let email: String
    @ObservedObject var viewModel: SignUpViewModel
    @Binding var isEmailVerified: Bool
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            iconSection
            titleSection
            loadingSection
            descriptionSection
            Spacer()
            buttonSection
        }
        .padding()
        .onAppear {
            viewModel.startEmailVerificationPolling()
        }
        .onDisappear {
            viewModel.stopEmailVerificationPolling()
        }
        .onChange(of: viewModel.isEmailVerified) { newValue in
            if newValue {
                isEmailVerified = true
            }
        }
    }
    
    @ViewBuilder
    private var iconSection: some View {
        Image(systemName: "envelope.badge")
            .resizable()
            .frame(width: 80, height: 64)
            .foregroundColor(.blue)
    }
    
    @ViewBuilder
    private var titleSection: some View {
        Text("Email Verification Required")
            .font(.title2)
            .fontWeight(.bold)
    }
    
    @ViewBuilder
    private var loadingSection: some View {
        if viewModel.isWaitingForVerification {
            ProgressView("Waiting for verification...")
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(1.2)
                .padding(.bottom, 8)
        }
    }
    
    @ViewBuilder
    private var descriptionSection: some View {
        Text("We have sent a verification email to \(email). Please check your inbox and follow the instructions to verify your account.")
            .multilineTextAlignment(.center)
            .foregroundColor(.gray)
    }
    
    @ViewBuilder
    private var buttonSection: some View {
        Button(action: {
            Task {
                await viewModel.checkEmailStatusManually()
            }
        }) {
            Text("Check Again")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
        }
        .padding(.horizontal, 24)
    }
} 
