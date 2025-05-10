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
                .frame(width: 125, height: 125)
                .padding(20)
            
            Button("Roll") {
                withAnimation{
                    numOfPoints = Int.random(in: 1...6)
                }
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    DIceView()
}
