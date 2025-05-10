//
//  ContentView.swift
//  DiceRoller
//
//  Created by Robert Oprean on 10.05.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numberOfDices: Int = 1
    
    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps())
            
            HStack {
                ForEach(1...numberOfDices, id: \.description) { _ in
                    DIceView()
                }
            }
            
            HStack {
                Button("Remove Dice") {
                    withAnimation() {
                        numberOfDices -= 1
                    }
                }
                .buttonStyle(.bordered)
                .disabled(numberOfDices == 1)
                
                Button("Add Dice") {
                    withAnimation() {
                        
                        numberOfDices += 1
                    }
                }
                .buttonStyle(.bordered)
                .disabled(numberOfDices == 3)
            }
            .padding()
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
