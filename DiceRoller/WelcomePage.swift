//
//  WelcomePage.swift
//  DiceRoller
//
//  Created by Robert Oprean on 10.05.2025.
//

import SwiftUI

struct WelcomePage: View {
    
    @State var isActive: Bool = false
    @State private var animateTitle: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                ContentView()
            }
            else {
                VStack {
                    Text("Dice Roller")
                        .font(.largeTitle.lowercaseSmallCaps())
                        .foregroundStyle(.white)
                        .offset(y: animateTitle ? -131 : 0)
                        .animation(.easeInOut(duration: 1), value: animateTitle)
                }
                .padding()
            }
        }
        .onAppear {
            withAnimation {
                animateTitle = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    isActive = true
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
