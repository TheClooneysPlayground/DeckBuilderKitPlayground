# `Effect` As Functions

We have changed `Effect` from a protocol to a function typealias.

## Previously

We had `Effect` as a protocol.

```swift
protocol Effect {
    func apply(to game: inout Game)
}

struct EventDrivenEffect: Effect {
    let event: GameEvent
    let effect: Effect

    init(_ event: GameEvent, @EffectBuilder effectBuilder: () -> Effect) {
        self.event = event

        effect = effectBuilder()
    }

    func apply(to game: inout Game) {
        game.register(effect: effect, for: event)
    }
}
```

But then I realized they are just a container of a function / a piece of code that has no data bind to them.

## Now

We have changed `Effect` to a function typealias.

```swift
typealis Effect = (inout Game) -> Void

func At(
    _ event: GameEvent,
    @EffectBuilder effectBuilder: @escaping () -> Effect)
-> Effect {
    { game in
        game.register(effect: effectBuilder(), for: event)
    }
}

func CombinedEffect(effects: [Effect]) -> Effect {
    { game in
        for effect in effects {
            effect(&game)
        }
    }
}

func Gain(_ value: Double, _ type: Attribute.AttributeType) -> Effect {
    { game in
        game.player.attributes[type]!.value += value
    }
}
```

## Gut Feelings

Somehow I have this gut feeleeling that I am less comfortable about having these `Effect`s as global free floating functions.

Let's dive in why I feel this way.

## Tradeoffs

### `Effect` As Functions

It's almost more pure, and functionally more pure, having `Effect`s as functions. Since essentially, when we had `Effect` As `protocol` and `struct`s, the `struct`s were purely another layer wraping up the functions, a container, without any extra information contained inside the `struct`s.

Say if those `struct`s, contained not just the logic / function, but more data, then it would make sense to have `Effect` as `struct`s.

But why I feel less comfortable with them being functions?

### `Effect` As `protocol` and `struct`s

With this approach, 

- There is more structure.
- There is this semantic grouping, holding all these different pieces of logical functions together.
  - With our design philosophy in mind, expressive, humanly readable and concise, I decided against having the functions under a `Effect` namespace. Otherwise, they code would become cumbersome to write and to read, too verbose.
- It can be more extensible.
  - Say in the future, we do find ourselves in a place to need to add more data into the `Effect`s.
  
  ## Verdict
  
  I think I am happier with the "`Effect` As `protocol` and `struct`s" approach for now. Let's keep evolving the code and see what happens.
