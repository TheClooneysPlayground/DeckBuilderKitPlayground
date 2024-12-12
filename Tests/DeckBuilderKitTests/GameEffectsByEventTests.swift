//
//  GameEffectsByEventTests.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

@testable import DeckBuilderKit
import Testing

struct GameEffectsByEventTests {
    @Test func gameShouldHaveAllEffectsByEvent() async throws {
        let game = Game()

        for event in GameEvent.allCases {
            #expect(game.effectsByEvent[event] != nil)
            #expect(game.effectsByEvent[event]?.isEmpty == true) // This is ugly. But without the `== true`, the type is `Bool?`
        }
    }
}
