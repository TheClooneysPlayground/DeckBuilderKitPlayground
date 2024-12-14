//
//  EventDrivenEffect.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

func At(
    _ event: GameEvent,
    @EffectBuilder effectBuilder: @escaping () -> Effect)
-> Effect {
    { game in
        game.register(effect: effectBuilder(), for: event)
    }
}
