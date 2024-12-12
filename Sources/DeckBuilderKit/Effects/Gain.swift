//
//  Gain.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

struct Gain: Effect {
    let type: Attribute.AttributeType
    let delta: Double

    init(_ value: Double, _ type: Attribute.AttributeType) {
        self.type = type
        self.delta = value
    }

    func apply(to game: inout Game) {
        game.player.attributes[type]!.value += delta
    }
}
