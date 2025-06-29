Scriptname DUT_AnimationListener extends ActiveMagicEffect

Actor property Target auto
Bool isShouting = false

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Target = akTarget
    RegisterForAnimationEvent(Target, "BeginCastVoice")
    RegisterForAnimationEvent(Target, "InterruptCast")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    If akSource == Target
        If asEventName == "BeginCastVoice"
            isShouting = true
        ElseIf asEventName == "InterruptCast"
            isShouting = false
        EndIf
    EndIf
EndEvent