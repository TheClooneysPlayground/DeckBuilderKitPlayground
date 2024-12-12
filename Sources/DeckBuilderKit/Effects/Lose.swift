//
//  Lose.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

struct Lose: Effect {
    private let effect: Effect

    init(_ value: Double, _ type: Attribute.AttributeType) {
        effect = Gain(-value, type)
    }

    func apply(to game: inout Game) {
        effect.apply(to: &game)
    }
}
