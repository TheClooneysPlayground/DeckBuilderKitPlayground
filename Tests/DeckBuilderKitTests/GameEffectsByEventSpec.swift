//
//  GameEffectsByEventSpec.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

@testable import DeckBuilderKit
import Quick
import Testing

final class GameEffectsByEventSpec: QuickSpec {
    override class func spec() {
        context("when creating a game") {
            var game: Game!

            beforeEach {
                game = makeGame()
            }

            it("creates an empty array of effects for each event") {
                for event in GameEvent.allCases {
                    #expect(game.effectsByEvent[event] != nil)
                    #expect(game.effectsByEvent[event]?.isEmpty == true) // This is ugly. But without the `== true`, the type is `Bool?`
                }
            }
        }
    }
}
