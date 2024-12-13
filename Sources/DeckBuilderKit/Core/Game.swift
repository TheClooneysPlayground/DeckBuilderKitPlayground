//
//  Game.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

public struct Game<
    Attribute: AttributeInterface,
    GameEvent: CaseIterable & Hashable
> {
    public var player = Player()

    // Interal access control so we can write tests for this.
    var effectsByEvent: [GameEvent: [Effect]] = makeEffectsByEvent()

    public init() {}

    public mutating func apply(effect: Effect) {
        effect.apply(to: &self)
    }

    public mutating func register(effect: Effect, for event: GameEvent) {
        effectsByEvent[event]!.append(effect)
    }

    public mutating func dispatch(event: GameEvent) {
        effectsByEvent[event]!.forEach { effect in
            effect.apply(to: &self)
        }
    }
}

private extension Game {
    /// Creates an empty array for each `GameEvent` type
    static func makeEffectsByEvent() -> [GameEvent: [Effect]] {
        var effectsByEvent = [GameEvent: [Effect]]()

        for event in GameEvent.allCases {
            effectsByEvent[event] = []
        }

        return effectsByEvent
    }
}
