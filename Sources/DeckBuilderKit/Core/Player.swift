//
//  Player.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

public protocol AttributeInterface {
    associatedtype AttributeType: CaseIterable & Hashable

    init(type: AttributeType, value: Double)

    var value: Double { get set }
}

public extension Game {
    struct Player {
        public var attributes: [Attribute.AttributeType: Attribute] = makeAttributes()

        public init() {}
    }
}

private extension Game.Player {
    static func makeAttributes() -> [Attribute.AttributeType: Attribute] {
        var attributes: [Attribute.AttributeType: Attribute] = [:]

        for type in Attribute.AttributeType.allCases {
            attributes[type] = Attribute(type: type, value: 0)
        }

        return attributes
    }
}

private let cli = """
cards (c)

(list all cards)

enemies (e)

(list all enemies)

card <0 - 10>

(pick a card)

target <0 - 10>

"""
