//
//  EffectBuilder.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

@resultBuilder
public enum EffectBuilder {
    public static func buildBlock(_ components: Effect...) -> Effect {
        CombinedEffect(effects: components)
    }
}
