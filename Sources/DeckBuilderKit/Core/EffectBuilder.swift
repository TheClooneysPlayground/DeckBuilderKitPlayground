//
//  EffectBuilder.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//


public extension Game {
    @resultBuilder
    enum EffectBuilder {
        public static func buildBlock(_ components: Effect...) -> Effect {
            .combined(effects: components)
        }
    }
}
