# dut-source

---

## Scripts Overview

# DUTCooldownControllerScript

## Overview

This Papyrus script manages a cooldown mechanic by applying and removing a Magic Effect (`CooldownEffect`) on a target actor using a temporary Spell (`CooldownSpell`). The cooldown effect prevents repeated actions during the cooldown duration.

## Properties

- **CooldownSpell** (`Spell`):  
  A Spell that contains the cooldown Magic Effect. This spell is added and immediately removed to trigger the cooldown effect on the target.

- **CooldownEffect** (`MagicEffect`):  
  The Magic Effect representing the cooldown status. This effect is applied via the `CooldownSpell` and removed after the cooldown timer expires.

- **CooldownDuration** (`Float`):  
  Duration of the cooldown in seconds. After this time, the cooldown effect is automatically removed.

- **ApplyToCaster** (`Bool`):  
  Determines whether the cooldown is applied to the caster (`true`) or the target (`false`) of the ActiveMagicEffect.

## How It Works

1. When the `ActiveMagicEffect` starts (`OnEffectStart`), the script determines the target actor based on `ApplyToCaster`.
2. If the target does **not** already have the cooldown effect active, the script applies the cooldown by adding then removing the `CooldownSpell` to trigger the `CooldownEffect`.
3. The script registers a single update callback after `CooldownDuration` seconds.
4. On update (`OnUpdate`), the cooldown effect is dispelled, effectively ending the cooldown period.

## Usage Notes

- Make sure the `CooldownSpell` contains the `CooldownEffect` in the Creation Kit.
- Assign all properties (`CooldownSpell`, `CooldownEffect`, `CooldownDuration`, `ApplyToCaster`) in the CK or via script.
- The script assumes the cooldown effect is uniquely identifiable and not shared with other mechanics.
- Use debug traces included in the script for troubleshooting cooldown application and removal.

---

[## Code](https://github.com/TabbyOS/dut-source/releases/tag/v1.0)

---

# Alduin Shout Selection Script

## Overview

This Papyrus script handles Alduin's shout selection and usage logic in combat. It dynamically determines which shouts Alduin can use based on cooldowns, AI enable flags, target distance, and orientation. The script uses global variables to store AI states and shout selection, and reference aliases for Alduin and his target.

---

## Properties

- **Quest / Reference Aliases**  
  - `Alduin`: Reference alias for Alduin actor.  
  - `ShoutTarget`: Reference alias for the current shout target actor.  
  - `ShoutTargetMarker`: Optional reference alias for targeting marker (if used).

- **MagicEffect Properties**  
  One MagicEffect property per shout cooldown effect (e.g. `VoiceAlduinFirebreathCooldownEffect`), used to track cooldowns preventing shout reuse.

- **Spell Properties**  
  Corresponding spells that contain the cooldown magic effects (e.g. `VoiceAlduinFirebreathCooldown`).

- **Global Variables**  
  Control flags for enabling each shout type AI usage (e.g. `DUTAlduinAIEnableFirebreath`), and current shout selection (`DUTAlduinShoutToUse`).

- **Int and Float Properties**  
  - `FailsafeTime`: Delay time used for cooldown or update throttling.  
  - Maximum ranges for each shout (e.g. `FirebreathMaxRange`).  
  - `TurningLimit`: Allowed angle deviation between Alduin's facing direction and the target for valid shout use.

---

## Core Logic

### Shout Selection (`SelectShouts(actor attacker)`)

- Checks if Alduin is ready to shout (no shout animation playing, cooldown expired, shout not already selected).
- For each shout type enabled by AI and not on cooldown, verifies:
  - Target is within the shout's max range.
  - Target is within Alduin's turning angle limit.
- Randomly selects one valid shout from all possible valid shouts.
- Sets `DUTAlduinShoutToUse` to the selected shout index.
- Forces Alduin to re-evaluate his AI package to trigger the shout.
- Registers a single update callback with `FailsafeTime` delay to prevent rapid repeat shout selection.

### Update Handling (`OnUpdate()`)

- Checks validity of the shout target (exists, not dead or disabled, within range).
- If conditions fail or Alduin is not currently shouting or casting voice, resets `DUTAlduinShoutToUse` to 0.
- Otherwise, re-registers for update to continue monitoring.

### Initialization (`OnInit()`)

- Resets shout selection global variable to 0.

---

## Usage Notes

- All cooldown MagicEffects must be applied and removed properly to prevent shout spamming.
- The script assumes global variables and reference aliases are correctly set and updated externally.
- Tuning of `FailsafeTime`, range, and turning limit values is essential for balanced and responsive AI shout usage.
- Extensive use of global variables allows toggling shout enablement and usage dynamically (e.g. via quests or other scripts).
- Debugging can be added around shout selection and cooldown checks to trace behavior during gameplay.

---



---

## Future Code:

