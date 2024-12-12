//
//  CombinedEffect.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

struct CombinedEffect: Effect {
    let effects: [Effect]

    func apply(to game: inout Game) {
        for effect in effects {
            effect.apply(to: &game)
        }
    }
}
