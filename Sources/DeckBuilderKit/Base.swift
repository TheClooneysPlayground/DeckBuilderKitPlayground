//
//  Card.swift
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

public struct Player {
    public var attributes: [Attribute.AttributeType: Attribute] = [
        .focus: Attribute(type: .focus, value: 0)
    ]
}

public enum GameEvent: CaseIterable {
    case startOfPlayerTurn
}

extension [GameEvent: [Effect]] {
    /// Creates an empty array for each `GameEvent` type
    static func make() -> Self {
        var effectsByEvent = [GameEvent: [Effect]]()

        for event in GameEvent.allCases {
            effectsByEvent[event] = []
        }

        return effectsByEvent
    }
}

public struct Game {
    public var player = Player()

    private var effectsByEvent: [GameEvent: [Effect]] = .make()

    public init() {}

    public mutating func apply(effect: Effect) {
        effect.apply(to: &self)
    }

    public mutating func register(effect: Effect, for event: GameEvent) {
        effectsByEvent[event]!.append(effect)
    }

    public mutating func dispatch(event: GameEvent) {
        effectsByEvent[event]!.forEach { effect in
            effect.apply(to: &self)
        }
    }
}

public protocol Effect {
    func apply(to game: inout Game)
}

struct Gain: Effect {
    let type: Attribute.AttributeType
    let delta: Double

    init(_ value: Double, _ type: Attribute.AttributeType) {
        self.type = type
        self.delta = value
    }

    func apply(to game: inout Game) {
        game.player.attributes[type]!.value += delta
    }
}

struct Lose: Effect {
    private let effect: Effect

    init(_ value: Double, _ type: Attribute.AttributeType) {
        effect = Gain(-value, type)
    }

    func apply(to game: inout Game) {
        effect.apply(to: &game)
    }
}

struct EventDrivenEffect: Effect {
    let event: GameEvent
    let effect: Effect

    init(_ event: GameEvent, @CardEffectBuilder effectBuilder: () -> Effect) {
        self.event = event

        effect = effectBuilder()
    }

    func apply(to game: inout Game) {
        game.register(effect: effect, for: event)
    }
}

typealias At = EventDrivenEffect

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

        effect = effectBuilder()
    }

    public func apply(to game: inout Game) {
        effect.apply(to: &game)
    }
}
