//
//  Debuff.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

import DeckBuilderKit

extension Spire.Effect {
    /// `Debuff` is speciliazed to Spire because it requires `Attribute.AttributeType.artifact`
    static func debuff(@Spire.EffectBuilder _ effectBuilder: () -> Self) -> Self {
        let effect = effectBuilder()

        return Self { game in
            guard
                game.player.attributes[.artifact]!.value > 0
            else {
                game.apply(effect: effect)

                return
            }

            // We do have artifact!

            game.player.attributes[.artifact]!.value -= 1

            // We do not apply the nested negative effect.
        }
    }
}
