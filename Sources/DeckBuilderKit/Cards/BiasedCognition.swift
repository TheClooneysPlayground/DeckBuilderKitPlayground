//
//  BiasedCognition.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

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

public let BiasedCognition = Card(name: "Biased Cognition") {
    Gain(4, .focus)

    Debuff {
        At(.startOfPlayerTurn) {
            Debuff {
                Lose(1, .focus)
            }
        }
    }
}
