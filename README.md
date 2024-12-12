# DeckBuilderKit


This is where I try to recreate Slay The Spire but in Swift with a custom DSL (Domain Specific Language).

## TODO List

### Biased Cog & Core Surge

#### [Biased Cog](https://slay.ocean.lol/w/slay%20the%20spire/biased%20cognition)

##### Behavior

- ✅ It gives you four more focus instantly.
- ✅ It takes away one focus at the start of player's turns.
- ✅ If you have Artifact before you play the card, then
    - ✅ 1. It takes away your Artifact.
    - ✅ 2. It does not add the Focus Lost effect.
- ✅ If you have Artifact after you play the card, then
  - ✅ It only stops the Focus Lost effect, ONCE.


##### Technical Components

- Game
- Player
- Attribute
- Card

- GameEvent
- Effect
  - Gain
  - Lose
  - EventDrivenEffect
  - CombinedEffect
- CardEffectBuilder (Result Builder in Swift)


#### [Core Surge](https://slay.ocean.lol/w/slay%20the%20spire/core%20surge)

- Deal 11 Damage
- ✅ Gain 1 Artifact
- Exhaust
