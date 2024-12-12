//
//  Cards.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

import Foundation


private let biasedCog = """
BiasedCogEffect = CardEffect {
  Gain(4, .focus)
  At(.startOfPlayerTurn) {
    Lose(1, .focus)
  }
}
BiasedCog = Card(
  type: .power,
  name: "Biased Cognition",
  rarity: .rare,
  character: .defect,
  energyCost: 1
) {
  // Effects
}
"""

public let BiasedCog = Card(name: "Biased Cognition") {
    Gain(4, .focus)
    At(.startOfPlayerTurn) {
        Lose(1, .focus)
    }
}

public let CoreSurge = Card(name: "Core Surge") {
    // Deal 11 Damage
    Gain(1, .artifact)
    // Exhaust
}
