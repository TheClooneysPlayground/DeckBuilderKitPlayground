//
//  Lose.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

func Lose(_ value: Double, _ type: Attribute.AttributeType) -> Effect {
    Gain(-value, type)
}
