Scriptname DUT_EffectTriggerHelper extends ActiveMagicEffect

Spell property VisualFXSpell auto
Actor property Owner auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    if VisualFXSpell != none
        akTarget.AddSpell(VisualFXSpell, false)
    EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    if VisualFXSpell != none
        akTarget.RemoveSpell(VisualFXSpell)
    EndIf
EndEvent