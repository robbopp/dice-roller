//
//  DiceView.swift
//  DiceRoller
//
//  Created by Robert Oprean on 10.05.2025.
//

import SwiftUI

struct DiceView: View {
    private let faceRange = 1...6
    private let diceSize: CGFloat = 100

    @State private var numOfPoints: Int = 1

    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numOfPoints).fill")
                .resizable()
                .frame(maxWidth: diceSize, maxHeight: diceSize)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.black, .white)
                .padding(7)

            Button("Roll") {
                withAnimation {
                    numOfPoints = Int.random(in: faceRange)
                }
            }
            .buttonStyle(.bordered)
            .font(.title2)
            .padding(.top, 10)
            .clipShape(Capsule())
        }
    }
}

#Preview {
    DiceView()
}
