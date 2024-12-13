//
//  EventDrivenEffect.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

public extension Game.Effect {
    static func at(_ event: GameEvent, @Game.EffectBuilder effectBuilder: () -> Self) -> Self {
        let effect = effectBuilder()

        return Self { game in
            game.register(effect: effect, for: event)
        }
    }
}
