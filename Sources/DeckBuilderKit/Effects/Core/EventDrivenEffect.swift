//
//  EventDrivenEffect.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

public extension Game {
    static func At(_ event: GameEvent, @EffectBuilder effectBuilder: () -> Effect) -> Effect {
        let effect = effectBuilder()

        return Effect { game in
            game.register(effect: effect, for: event)
        }
    }
}
