//
//  EventDrivenEffect.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

typealias At = EventDrivenEffect

struct EventDrivenEffect: Effect {
    let event: GameEvent
    let effect: Effect

    init(_ event: GameEvent, @EffectBuilder effectBuilder: () -> Effect) {
        self.event = event

        effect = effectBuilder()
    }

    func apply(to game: inout Game) {
        game.register(effect: effect, for: event)
    }
}
