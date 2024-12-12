//
//  BiasedCogTests.swift
//  DeckBuilderKitTests
//
//  Created by Nicholas Clooney on 12/12/2024.
//

import DeckBuilderKit
import Testing

struct BiasedCogTests {
    var game: Game

    init() {
        game = Game()
    }

    @Test mutating func biasedCogIncreasesFocus() async throws {
        game.apply(effect: BiasedCog)

        #expect(game.player.attributes[.focus]!.intValue == 4)
    }

    @Test mutating func biasedCogDecreasesFocusAtStartOfPlayerTurn() async throws {
        game.apply(effect: BiasedCog)

        try #require(game.player.attributes[.focus]!.intValue == 4)

        // First time...

        game.dispatch(event: .startOfPlayerTurn)

        #expect(game.player.attributes[.focus]!.intValue == 3)

        // Every time...

        game.dispatch(event: .startOfPlayerTurn)

        #expect(game.player.attributes[.focus]!.intValue == 2)

        game.dispatch(event: .startOfPlayerTurn)

        #expect(game.player.attributes[.focus]!.intValue == 1)

        game.dispatch(event: .startOfPlayerTurn)

        #expect(game.player.attributes[.focus]!.intValue == 0)

        // Oh it goes negative...

        game.dispatch(event: .startOfPlayerTurn)

        #expect(game.player.attributes[.focus]!.intValue == -1)
    }
}
