//
//  Mocks.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 13/12/2024.
//

import DeckBuilderKit

typealias Game = DeckBuilderKit.Game<Attribute, GameEvent>

func makeGame() -> Game {
    Game()
}

struct Attribute: AttributeInterface {
    enum AttributeType: CaseIterable {
        case health
    }

    var type: AttributeType
    var value: Double

    init(type: AttributeType, value: Double) {
        self.type = type
        self.value = value
    }
}

enum GameEvent: CaseIterable {
    case startOfPlayerTurn
}

