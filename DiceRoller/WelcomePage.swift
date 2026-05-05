//
//  WelcomePage.swift
//  DiceRoller
//
//  Created by Robert Oprean on 10.05.2025.
//

import SwiftUI

struct WelcomePage: View {
    private let titleAnimationDelay: TimeInterval = 1.5
    private let titleAnimationDuration: TimeInterval = 1.0
    private let transitionDelay: TimeInterval = 1.0
    private let titleOffset: CGFloat = -132

    @State private var isActive: Bool = false
    @State private var animateTitle: Bool = false

    var body: some View {
        ZStack {
            if isActive {
                ContentView()
            } else {
                VStack {
                    Text("Dice Roller")
                        .font(.largeTitle.lowercaseSmallCaps())
                        .foregroundStyle(.white)
                        .offset(y: animateTitle ? titleOffset : 0)
                        .animation(.easeInOut(duration: titleAnimationDuration), value: animateTitle)
                }
                .padding()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + titleAnimationDelay) {
                animateTitle = true
                DispatchQueue.main.asyncAfter(deadline: .now() + transitionDelay) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.appBackground)
    }
}

#Preview {
    WelcomePage()
}
