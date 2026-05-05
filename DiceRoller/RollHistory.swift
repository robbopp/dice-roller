//
//  RollHistory.swift
//  DiceRoller
//
//  Created by Robert Oprean on 10.05.2025.
//

import SwiftUI

struct RollRecord: Identifiable {
    let id = UUID()
    let values: [Int]
    var sum: Int { values.reduce(0, +) }
}

struct HistoryRow: View {
    let record: RollRecord

    var body: some View {
        HStack {
            HStack(spacing: 4) {
                ForEach(record.values.indices, id: \.self) { i in
                    Image(systemName: "die.face.\(record.values[i]).fill")
                        .font(.title2)
                        .foregroundStyle(.black, .white)
                }
            }
            Spacer()
            Text("→  \(record.sum)")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }
        .padding(.horizontal)
        .padding(.vertical, 6)
    }
}
