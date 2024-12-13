//
//  Card.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//


public extension Game {
    struct Card {
        let name: String
        let effect: Effect

        // Game Specific

        // let type: CardType
        // let rarity: Rarity
        // let character: Character
        // let energyCost: Int

        public init(name: String, @EffectBuilder effectBuilder: () -> Effect) {
            self.name = name

            effect = effectBuilder()
        }
    }
}
