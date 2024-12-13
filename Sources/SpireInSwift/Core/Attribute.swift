//
//  Attribute.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

import DeckBuilderKit

public struct Attribute: AttributeInterface {
    public enum AttributeType: CaseIterable {
        case focus
        case artifact
    }

    public let type: AttributeType
    public var value: Double

    public init(type: AttributeType, value: Double) {
        self.type = type
        self.value = value
    }

    public var intValue: Int {
        Int(value)
    }
}
