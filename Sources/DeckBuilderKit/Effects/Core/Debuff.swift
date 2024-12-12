//
//  Debuff.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

/// `Debuff`
/// Quite game specific because it uses game specific attributes.
struct Debuff: Effect {
    private let nestedEffect: Effect

    init(@EffectBuilder _  effectBuilder: () -> Effect) {
        self.nestedEffect = effectBuilder()
    }

    func apply(to game: inout Game) {
        guard
            game.player.attributes[.artifact]!.value > 0
        else {
            game.apply(effect: nestedEffect)

            return
        }

        // We do have artifact!

        game.player.attributes[.artifact]!.value -= 1

        // We do not apply the nested negative effect.
    }
}
