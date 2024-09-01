//
//  ResultBuilderPlayground.swift
//  DeckBuilderKit
//
//  Created by Nicholas Clooney on 1/9/2024.
//

//import Foundation


//@resultBuilder
//struct CardBuilder {
//    static func buildBlock(_ components: any Effect...) -> any Effect {
//        components.first!
//    }
//}
//
//func apply(@CardBuilder content: () -> any Effect) -> any Effect {
//    return content()
//}

//func test() {
//    let effect = apply {
//        Attack(baseDamage: 6)
//    }
//}

struct Creature {
    var hp: Double
    var name: String
}

protocol Effect {
    associatedtype Target

    func apply(to target: inout Target)
}

struct AnyEffect<Target>: Effect {
    private let applyFunc: (inout Target) -> Void

    init<E: Effect>(_ effect: E) where E.Target == Target {
        applyFunc = effect.apply
    }

    func apply(to target: inout Target){
        applyFunc(&target)
    }
}

extension Effect {
    func erasedPullback<Parent>(transform: @escaping (Parent) -> Target) -> AnyEffect<Parent> {
        pullback(transform: transform)
            .erasedToAnyEffect()
    }

    func pullback<Parent>(transform: @escaping (Parent) -> Target) -> PullbackEffect<Parent, Self> {
        PullbackEffect(transform: transform, childEffect: self)
    }

    func erasedToAnyEffect() -> AnyEffect<Target> {
        AnyEffect(self)
    }
}


struct Attack: Effect {
    var baseDamage: Double
    var scale: Double = 1

    typealias Target = Creature

    func apply(to target: inout Creature) {
        target.hp -= baseDamage * scale
    }
}

struct Fight {
    let player: Creature
    let enemy: Creature
}

struct PullbackEffect<Parent, ChildEffect: Effect>: Effect {
    typealias Target = Parent

    let transform: (Parent) -> ChildEffect.Target
    let childEffect: ChildEffect

    func apply(to target: inout Parent) {
        var child = transform(target)
        childEffect.apply(to: &child)
    }
}


func pullback<Child, Parent>(
    apply: @escaping (inout Child) -> Void,
    transform: @escaping (Parent) -> Child
) -> (inout Parent) -> Void {
    { parent in
        var child = transform(parent)
        apply(&child)
    }
}

struct Card<Target, E: Effect> where E.Target == Target {
    let name: String
    let effects: [E]

    func apply(to target: inout Target) {
        for effect in effects {
            effect.apply(to: &target)
        }
    }
}

struct FightEffect: Effect {
    typealias Target = Fight

    func apply(to target: inout Fight) {
        // does nothing
    }
}

func test2() {
    var player = Creature(hp: 69, name: "Player One")
    var louse = Creature(hp: 13, name: "Louse")
    let attack = Attack(baseDamage: 6)

    var fight = Fight(player: player, enemy: louse)

    let strike = Card(
        name: "Strike",
        effects: [
            attack.erasedPullback(transform: \Fight.player),
            FightEffect().erasedToAnyEffect()
        ]
    )

    strike.apply(to: &fight)

    print(louse)
}
