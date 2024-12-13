//
//  EventDrivenEffectSpec.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 13/12/2024.
//

@testable import DeckBuilderKit
import Quick
import Testing

final class EventDrivenEffectSpec: QuickSpec {
    override class func spec() {
        var game: Game!

        beforeEach {
            game = makeGame()
        }

        context("after registering event drivent effect") {
            beforeEach {
                try #require(game.player.attributes[.health]?.value == 0)

                let effect = Game.Effect.at(.startOfPlayerTurn) {
                    Game.Effect.gain(1, .health)
                }
                game.apply(effect: effect)
            }

            context("at the start of player's turn") {
                beforeEach {
                    game.dispatch(event: .startOfPlayerTurn)
                }

                it("adds one health") {
                    #expect(game.player.attributes[.health]?.value == 0)
                }
            }
        }

    }
}
