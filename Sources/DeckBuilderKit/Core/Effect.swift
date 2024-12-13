//
//  Effect.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

public extension Game {
    struct Effect {
        let effect: (inout Game) -> Void

        public init(effect: @escaping (inout Game) -> Void) {
            self.effect = effect
        }

        func apply(to game: inout Game) {
            effect(&game)
        }
    }
}
