//
//  Attribute.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

public struct Attribute {
    public enum AttributeType {
        case focus
        case artifact
    }

    public let type: AttributeType
    public var value: Double

    public var intValue: Int {
        Int(value)
    }
}
