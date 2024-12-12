//
//  CoreSurgeTests.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

import DeckBuilderKit
import Testing

struct CoreSurgeTests {
    var game: Game

    init() {
        game = Game()
    }

    // TODO: WE ARE GONNA ADD Quick/Quick

    @Test mutating func biasedCogDoesNotApplyDebuffWhenWeHaveArtifact() async throws {
        // game.player.attributes[.artifact]!.value = 1

        game.apply(effect: CoreSurge)

        game.apply(effect: BiasedCognition)

        try #require(game.player.attributes[.focus]!.intValue == 4)

        game.dispatch(event: .startOfPlayerTurn)

        #expect(game.player.attributes[.focus]!.intValue == 4)
    }

    @Test mutating func biasedCogDoesNotApplyFocusLossAfterWePlayCoreSurgeForOnce() async throws {
        game.apply(effect: BiasedCognition)

        game.dispatch(event: .startOfPlayerTurn)

        #expect(game.player.attributes[.focus]!.intValue == 3)

        game.apply(effect: CoreSurge)

        game.dispatch(event: .startOfPlayerTurn)

        #expect(game.player.attributes[.focus]!.intValue == 3)

        game.dispatch(event: .startOfPlayerTurn)

        #expect(game.player.attributes[.focus]!.intValue == 2)

        #expect(game.player.attributes[.artifact]!.intValue == 0)

    }
}
