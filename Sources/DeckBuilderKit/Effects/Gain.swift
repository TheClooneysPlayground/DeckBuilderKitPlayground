//
//  Gain.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

public extension Game.Effect {
    static func gain(_ value: Double, _ type: Attribute.AttributeType) -> Self {
        Self { game in
            game.player.attributes[type]!.value += value
        }
    }
}
