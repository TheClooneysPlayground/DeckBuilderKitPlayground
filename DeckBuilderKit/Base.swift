//
//  Card.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 12/12/2024.
//

public struct Attribute {
    public enum AttributeType {
        case focus
    }

    public let type: AttributeType
    public var value: Double

    public var intValue: Int {
        Int(value)
    }
}

public struct Player {
    public var attributes: [Attribute.AttributeType: Attribute] = [
        .focus: Attribute(type: .focus, value: 0)
    ]
}

public struct Game {
    public var player = Player()

    public init() {}

    public mutating func apply(effect: Effect) {
        effect.apply(to: &self)
    }
}

public protocol Effect {
    func apply(to game: inout Game)
}

public struct Gain: Effect {
    let type: Attribute.AttributeType
    let delta: Double

    public init(_ value: Double, _ type: Attribute.AttributeType) {
        self.type = type
        self.delta = value
    }

    public func apply(to game: inout Game) {
        game.player.attributes[type]!.value += delta
    }
}

struct CombinedEffect: Effect {
    let effects: [Effect]

    func apply(to game: inout Game) {
        for effect in effects {
            effect.apply(to: &game)
        }
    }
}

@resultBuilder
public enum CardEffectBuilder {
    public static func buildBlock(_ components: Effect...) -> Effect {
        CombinedEffect(effects: components)
    }
}

public struct CardEffect {
    let effect: Effect

    init(@CardEffectBuilder content: () -> Effect) {
        effect = content()
    }
}

public struct Card: Effect {
    let name: String
    let effect: Effect
    // let energyCost: Int
    // let type: CardType
    // let character: CharacterType

    public init(name: String, @CardEffectBuilder effectBuilder: () -> Effect) {
        self.name = name
        self.effect = effectBuilder()
    }

    public func apply(to game: inout Game) {
        effect.apply(to: &game)
    }
}

let biasedCog = """
BiasedCogEffect = CardEffect {
  Gain(4, .focus)
  At(.startOfPlayerTurn) {
    Lose(1, .focus)
  }
}
BiasedCog = Card(
  name: "Biased Cognition",
  energyCost: 1,
  type: .power,
  character: .defect
)
"""
