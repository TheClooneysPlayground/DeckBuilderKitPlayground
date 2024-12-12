//
//  CardTests.swift
//  DeckBuilderKitTests
//
//  Created by Nicholas Clooney on 12/12/2024.
//

import DeckBuilderKit
import Testing

struct CardTests {

    @Test func biasedCogIncreasesFocus() async throws {
        var game = Game()

        game.apply(effect: BiasedCog)

        #expect(game.player.attributes[.focus]!.intValue == 4)
    }
}
