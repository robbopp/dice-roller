//
//  DiceView.swift
//  DiceRoller
//
//  Created by Robert Oprean on 10.05.2025.
//

import SwiftUI

struct DiceView: View {
    let value: Int
    private let diceSize: CGFloat = 100

    var body: some View {
        Image(systemName: "die.face.\(value).fill")
            .resizable()
            .frame(maxWidth: diceSize, maxHeight: diceSize)
            .aspectRatio(1, contentMode: .fit)
            .foregroundStyle(.black, .white)
            .padding(7)
    }
}

#Preview {
    DiceView(value: 3)
}
