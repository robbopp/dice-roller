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
    private let rollCycles = 10
    private let rollInterval: TimeInterval = 0.08

    @State private var diceValues: [Int] = [1]
    @State private var isRolling = false
    @State private var history: [RollRecord] = []

    @MainActor
    private func rollAll() async {
        isRolling = true
        for _ in 0..<rollCycles {
            diceValues = diceValues.map { _ in Int.random(in: faceRange) }
            try? await Task.sleep(for: .seconds(rollInterval))
        }
        let finalValues = diceValues.map { _ in Int.random(in: faceRange) }
        withAnimation {
            diceValues = finalValues
        }
        history.insert(RollRecord(values: finalValues), at: 0)
        isRolling = false
    }

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
                Task { await rollAll() }
            }
            .buttonStyle(.borderedProminent)
            .tint(.white)
            .foregroundStyle(.appBackground)
            .font(.title2)
            .clipShape(Capsule())
            .padding(.vertical, 8)
            .disabled(isRolling)

            HStack {
                Button("Remove Dice", systemImage: "minus.circle.fill") {
                    withAnimation {
                        diceValues = Array(diceValues.dropLast())
                    }
                }
                .disabled(diceValues.count == minDice || isRolling)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.black, .white)

                Button("Add Dice", systemImage: "plus.circle.fill") {
                    withAnimation {
                        diceValues.append(Int.random(in: faceRange))
                    }
                }
                .disabled(diceValues.count == maxDice || isRolling)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.black, .white)
            }
            .labelStyle(.iconOnly)
            .font(.title)

            if !history.isEmpty {
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(history) { record in
                            HistoryRow(record: record)
                        }
                    }
                }
                .frame(maxHeight: 220)
                .mask(
                    LinearGradient(
                        stops: [
                            .init(color: .black, location: 0),
                            .init(color: .black, location: 0.45),
                            .init(color: .black.opacity(0.4), location: 0.75),
                            .init(color: .clear, location: 1.0)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
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
