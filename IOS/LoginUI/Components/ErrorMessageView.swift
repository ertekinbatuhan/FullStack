//
//  ErrorMessageView.swift
//  LoginUI
//
//  Created by Batuhan Berk Ertekin on 25.07.2025.
//

import SwiftUI

struct ErrorMessageView: View {
    let message: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundColor(.red)
            Text(message)
                .foregroundColor(.red)
                .font(.system(size: 15, weight: .medium))
                .multilineTextAlignment(.leading)
        }
        .padding(.top, 8)
        .transition(.opacity.combined(with: .move(edge: .top)))
        .animation(.easeInOut, value: message)
    }
}
