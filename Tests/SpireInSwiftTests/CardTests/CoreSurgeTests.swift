//
//  CoreSurgeTests.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

import DeckBuilderKit
import Quick
import SpireInSwift
import Testing

final class CoreSurgeSpec: QuickSpec {
    override class func spec() {
        var game: Spire!

        beforeEach {
            game = Spire()
        }

        context("when core surge is applied after biased cognition") {
            beforeEach {
                game.play(card: BiasedCognition)
                game.play(card: CoreSurge)
            }

            context("at the start of the player's turn") {
                beforeEach {
                    game.dispatch(event: .startOfPlayerTurn)
                }

                it("does stop debuff for the first time") {
                    #expect(game.player.attributes[.focus]!.intValue == 4)
                }
            }

            context("after the first turn") {
                beforeEach {
                    game.dispatch(event: .startOfPlayerTurn)
                    game.dispatch(event: .startOfPlayerTurn)
                }

                it("does NOT stop debuff anymore") {
                    #expect(game.player.attributes[.focus]!.intValue == 3)
                }
            }
        }

        context("when core surge is applied before biased cognition") {
            beforeEach {
                game = Game()
                game.play(card: CoreSurge)
                game.play(card: BiasedCognition)
            }

            context("at the start of the player's turn") {
                beforeEach {
                    game.dispatch(event: .startOfPlayerTurn)
                }

                it("does stop the entire debuff") {
                    #expect(game.player.attributes[.focus]!.intValue == 4)
                }

            }

            context("after the first turn") {
                beforeEach {
                    game.dispatch(event: .startOfPlayerTurn)
                }

                it("does still stop the debuffs") {
                    #expect(game.player.attributes[.focus]!.intValue == 4)
                }
            }

        }
    }
}