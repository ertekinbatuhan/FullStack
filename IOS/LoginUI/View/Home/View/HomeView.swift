//
//  HomeView.swift
//  LoginUI
//
//  Created by Batuhan Berk Ertekin on 23.07.2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Welcome")
                .font(.largeTitle)
                .padding()
            Text("You have logged in successfully.")
                .font(.title2)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
} 
