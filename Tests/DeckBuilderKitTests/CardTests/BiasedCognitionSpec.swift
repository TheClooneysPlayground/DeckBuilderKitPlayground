//
//  BiasedCognitionSpec.swift
//  DeckBuilderKitTests
//
//  Created by Nicholas Clooney on 12/12/2024.
//

import DeckBuilderKit
import Quick
import Testing

final class BiasedCognitionSpec: QuickSpec {
    override class func spec() {
        var game: Game!

        beforeEach {
            game = Game()
        }

        context("when bisaed cognition is played") {
            beforeEach {
                game.apply(effect: BiasedCognition)
            }

            it("gives us 4 focus") {
                #expect(game.player.attributes[.focus]!.intValue == 4)
            }

            context("after the first turn") {
                beforeEach {
                    game.dispatch(event: .startOfPlayerTurn)
                }

                it("lowers focus by 1") {
                    #expect(game.player.attributes[.focus]!.intValue == 3)
                }
            }

            context("after the second turn") {
                beforeEach {
                    game.dispatch(event: .startOfPlayerTurn)
                    game.dispatch(event: .startOfPlayerTurn)
                }

                it("lowers focus by 2") {
                    #expect(game.player.attributes[.focus]!.intValue == 2)
                }
            }

            context("after 5 turns") {
                beforeEach {
                    (0..<5).forEach { _ in
                        game.dispatch(event: .startOfPlayerTurn)
                    }
                }

                it("has -1 focus") {
                    #expect(game.player.attributes[.focus]!.intValue == -1)
                }
            }
        }
    }
}
