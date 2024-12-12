//
//  Cards.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

import Foundation

public let BiasedCog = Card(name: "Biased Cognition") {
    Gain(4, .focus)
    At(.startOfPlayerTurn) {
        Lose(1, .focus)
    }
}

