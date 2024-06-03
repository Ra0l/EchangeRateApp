//
//  SplashScreenView.swift
//  AppExchange
//
//  Created by Raul Kevin Aliaga Shapiama on 6/2/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive {
            ExchangeRateView()
        } else {
            VStack {
                VStack {
                    Image(systemName: "dollarsign.arrow.circlepath")
                        .font(.system(size: 80))
                        .foregroundStyle(.green)
                    Text("App Exhange Rate")
                        .fontWeight(.bold)
                        .font(.system(size: 40))
                        .foregroundStyle(.green.opacity(0.88))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 2.3)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
