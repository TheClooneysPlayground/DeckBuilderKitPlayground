//
//  Card.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

/// NOTE: Does `Card` have to be an `Effect`?
/// Can we not just have `Game.play(card: card)`?
public struct Card: Effect {
    let name: String
    let effect: Effect
    // let type: CardType
    // let rarity: Rarity
    // let character: Character
    // let energyCost: Int

    public init(name: String, @EffectBuilder effectBuilder: () -> Effect) {
        self.name = name

        effect = effectBuilder()
    }

    public func apply(to game: inout Game) {
        effect.apply(to: &game)
    }
}
