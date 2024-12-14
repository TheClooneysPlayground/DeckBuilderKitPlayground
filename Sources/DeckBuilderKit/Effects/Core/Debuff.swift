//
//  Debuff.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

/// `Debuff`
/// Quite game specific because it uses game specific attributes.
func Debuff(@EffectBuilder _  effectBuilder: @escaping () -> Effect) -> Effect {
    { game in
        guard
            game.player.attributes[.artifact]!.value > 0
        else {
            game.apply(effect: effectBuilder())

            return
        }

        // We do have artifact!

        game.player.attributes[.artifact]!.value -= 1

        // We do not apply the nested negative effect.
    }
}
