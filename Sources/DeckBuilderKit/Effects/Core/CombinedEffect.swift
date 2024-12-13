//
//  CombinedEffect.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//


public extension Game.Effect {
    static func combined(effects: [Self]) -> Self {
        Self { game in
            for effect in effects {
                effect.apply(to: &game)
            }
        }
    }
}
