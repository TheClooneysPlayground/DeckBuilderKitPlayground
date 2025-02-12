//
//  PlayerAttributesSpec.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

import DeckBuilderKit
import Quick
import Testing

final class PlayerAttributesSpec: QuickSpec {
    override class func spec() {
        context("when creating a player") {
            var player: Player!
            beforeEach {
                player = Player()
            }

            it("creates an attribute for all attributes, with default value set to 0") {
                for attribute in Attribute.AttributeType.allCases {
                    #expect(player.attributes[attribute] != nil)
                    #expect(player.attributes[attribute]?.value == 0)
                }
            }
        }
    }
}
