//
//  ContentView.swift
//  DiceRoller
//
//  Created by Robert Oprean on 10.05.2025.
//

import SwiftUI

struct ContentView: View {
    private let minDice = 1
    private let maxDice = 5

    @State private var numberOfDices: Int = 1

    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps())
                .foregroundStyle(.white)

            HStack {
                ForEach(1...numberOfDices, id: \.self) { _ in
                    DiceView()
                }
            }

            HStack {
                Button("Remove Dice", systemImage: "minus.circle.fill") {
                    withAnimation {
                        numberOfDices -= 1
                    }
                }
                .disabled(numberOfDices == minDice)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.black, .white)

                Button("Add Dice", systemImage: "plus.circle.fill") {
                    withAnimation {
                        numberOfDices += 1
                    }
                }
                .disabled(numberOfDices == maxDice)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.black, .white)
            }
            .padding()
            .labelStyle(.iconOnly)
            .font(.title)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.appBackground)
        .tint(.white)
    }
}

#Preview {
    ContentView()
}
