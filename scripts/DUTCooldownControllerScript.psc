Scriptname DUTCooldownControllerScript extends ActiveMagicEffect

Spell Property CooldownSpell Auto
MagicEffect Property CooldownEffect Auto
Float Property CooldownDuration = 10.0 Auto
Bool Property ApplyToCaster = True Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Actor targetActor = ApplyToCaster ? akCaster : akTarget

    If targetActor == None || CooldownSpell == None || CooldownEffect == None
        Debug.Trace("DUT CooldownControllerScript: Invalid input - TargetActor or CooldownSpell or CooldownEffect is None")
        Return
    EndIf

    If !targetActor.HasMagicEffect(CooldownEffect)
        Debug.Trace("DUT CooldownControllerScript: Applying cooldown spell to target")
        targetActor.AddSpell(CooldownSpell, False)
        targetActor.RemoveSpell(CooldownSpell)
    Else
        Debug.Trace("DUT CooldownControllerScript: Target already has cooldown effect active")
    EndIf

    RegisterForSingleUpdate(CooldownDuration)
EndEvent

Event OnUpdate()
    Actor target = GetCasterActor()
    If target != None && target.HasMagicEffect(CooldownEffect)
        Debug.Trace("DUT CooldownControllerScript: Removing cooldown effect from target")
        target.DispelMagicEffect(CooldownEffect)
    EndIf

    UnregisterForUpdate()
EndEvent
