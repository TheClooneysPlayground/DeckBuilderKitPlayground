//
//  Player.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

public struct Player {
    public var attributes: [Attribute.AttributeType: Attribute] = .make()

    public init() {}
}

private extension [Attribute.AttributeType: Attribute] {
    static func make() -> [Attribute.AttributeType: Attribute] {
        var attributes: [Attribute.AttributeType: Attribute] = [:]

        for type in Attribute.AttributeType.allCases {
            attributes[type] = Attribute(type: type, value: 0)
        }

        return attributes
    }
}
