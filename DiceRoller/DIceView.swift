//
//  DIceView.swift
//  DiceRoller
//
//  Created by Robert Oprean on 10.05.2025.
//

import SwiftUI

struct DIceView: View {
    @State private var numOfPoints: Int = 1
    
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numOfPoints)")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1, contentMode: .fit)
                .padding(7)
            
            Button("Roll") {
                withAnimation{
                    numOfPoints = Int.random(in: 1...6)
                }
            }
            .buttonStyle(.bordered)
            .font(.title2)
            .padding(.top, 10)
        }
    }
}

#Preview {
    DIceView()
}
