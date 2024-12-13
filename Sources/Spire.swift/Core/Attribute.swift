//
//  Attribute.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

import DeckBuilderKit

struct Attribute: AttributeInterface {
    public enum AttributeType: CaseIterable {
        case focus
        case artifact
    }

    let type: AttributeType
    var value: Double

    var intValue: Int {
        Int(value)
    }
}
