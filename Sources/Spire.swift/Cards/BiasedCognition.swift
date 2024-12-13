//
//  BiasedCognition.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

import DeckBuilderKit

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

private let bisaedCogV2 = """

BiasedCog = Card(data: GameSpecificCardData()) {
}

"""

//let effect: Spire.Effect = .lose(1, .focus)

let BiasedCognition = Spire.Card(name: "Biased Cognition") {
    Spire.Effect.gain(4, .focus)

    Spire.Effect.debuff {
        Spire.Effect.at(.startOfPlayerTurn) {
            Spire.Effect.debuff {
                Spire.Effect.lose(1, .focus)
            }
        }
    }
}

private let ThePerfectBiasedCognition =
"""
Spire.Card(name: "Biased Cognition") {
  Gain(4, .focus)
  Debuff {
    At(.startOfPlayerTurn) {
      Debuff {
        Lose(1, .focus)
      }
    }
  }
}
"""

private let TheLessPerfectBiasedCognition =
"""
Spire.Card(name: "Biased Cognition") {
  .gain(4, .focus)
  .debuff {
    .at(.startOfPlayerTurn) {
      .debuff {
        .lose(1, .focus)
      }
    }
  }
}
"""

private let resultBuilder = """
  
"""
