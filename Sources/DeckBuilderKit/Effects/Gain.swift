//
//  Gain.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

func Gain(_ value: Double, _ type: Attribute.AttributeType) -> Effect {
    { game in
        game.player.attributes[type]!.value += value
    }
}
