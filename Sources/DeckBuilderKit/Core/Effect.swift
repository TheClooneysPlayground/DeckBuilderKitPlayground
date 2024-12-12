//
//  Effect.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

public protocol Effect {
    func apply(to game: inout Game)
}
