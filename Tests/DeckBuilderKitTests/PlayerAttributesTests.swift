//
//  PlayerAttributesTests.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

import DeckBuilderKit
import Testing

struct PlayerAttributesTests {
    @Test func playerShouldHaveAllAttributesSetToZero() async throws {
        let player = Player()

        for attribute in Attribute.AttributeType.allCases {
            #expect(player.attributes[attribute] != nil)
            #expect(player.attributes[attribute]?.value == 0)
        }
    }
}
