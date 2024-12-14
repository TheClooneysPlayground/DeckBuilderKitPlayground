//
//  CombinedEffect.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

func CombinedEffect(effects: [Effect]) -> Effect {
    { game in
        for effect in effects {
            effect(&game)
        }
    }
}
