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
    private let faceRange = 1...6

    @State private var diceValues: [Int] = [1]

    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps())
                .foregroundStyle(.white)

            HStack {
                ForEach(diceValues.indices, id: \.self) { index in
                    DiceView(value: diceValues[index])
                }
            }

            Button(diceValues.count == minDice ? "Roll" : "Roll All") {
                withAnimation {
                    diceValues = diceValues.map { _ in Int.random(in: faceRange) }
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.white)
            .foregroundStyle(.appBackground)
            .font(.title2)
            .clipShape(Capsule())
            .padding(.vertical, 8)

            HStack {
                Button("Remove Dice", systemImage: "minus.circle.fill") {
                    withAnimation {
                        diceValues = Array(diceValues.dropLast())
                    }
                }
                .disabled(diceValues.count == minDice)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.black, .white)

                Button("Add Dice", systemImage: "plus.circle.fill") {
                    withAnimation {
                        diceValues.append(Int.random(in: faceRange))
                    }
                }
                .disabled(diceValues.count == maxDice)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.black, .white)
            }
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
