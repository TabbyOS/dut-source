Quest property DragonsUseThuumVoicePowers auto
referencealias property Alduin auto
referencealias property ShoutTargetMarker auto
referencealias property ShoutTarget auto
magiceffect property VoiceAlduinFirebreathCooldownEffect auto
magiceffect property VoiceAlduinFrostbreathCooldownEffect auto
magiceffect property VoiceAlduinUnrelentingForceCooldownEffect auto
magiceffect property VoiceAlduinDismayCooldownEffect auto
magiceffect property VoiceAlduinDisarmCooldownEffect auto
magiceffect property VoiceAlduinIceFormCooldownEffect auto
magiceffect property VoiceAlduinDevourSoulCooldownEffect auto
magiceffect property VoiceAlduinCrushWillCooldownEffect auto
spell property VoiceAlduinFirebreathCooldown auto
spell property VoiceAlduinFrostbreathCooldown auto
spell property VoiceAlduinUnrelentingForceCooldown auto
spell property VoiceAlduinDismayCooldown auto
spell property VoiceAlduinDisarmCooldown auto
spell property VoiceAlduinIceFormCooldown auto
spell property VoiceAlduinDevourSoulCooldown auto
spell property VoiceAlduinCrushWillCooldown auto
globalvariable property DUTAlduinShoutToUse auto
globalvariable property DUTAlduinUseFirebreath auto
globalvariable property DUTAlduinUseFrostbreath auto
globalvariable property DUTAlduinUseUnrelentingForce auto
globalvariable property DUTAlduinUseDismay auto
globalvariable property DUTAlduinUseDisarm auto
globalvariable property DUTAlduinUseIceForm auto
globalvariable property DUTAlduinUseDevourSoul auto
globalvariable property DUTAlduinUseCrushWill auto
globalvariable property DUTAlduinAIEnableFirebreath auto
globalvariable property DUTAlduinAIEnableFrostbreath auto
globalvariable property DUTAlduinAIEnableUnrelentingForce auto
globalvariable property DUTAlduinAIEnableDismay auto
globalvariable property DUTAlduinAIEnableDisarm auto
globalvariable property DUTAlduinAIEnableIceForm auto
globalvariable property DUTAlduinAIEnableDevourSoul auto
globalvariable property DUTAlduinAIEnableCrushWill auto
Int property FailsafeTime auto
Int property FirebreathMaxRange auto
Int property FrostbreathMaxRange auto
Int property UnrelentingForceMaxRange auto
Int property DismayMaxRange auto
Int property DisarmMaxRange auto
Int property IceFormMaxRange auto
Int property DevourSoulMaxRange auto
Int property CrushWillMaxRange auto
Float property TurningLimit auto

function SelectShouts(actor attacker)
	if attacker != none
		actor AlduinRef = Alduin.GetActorRef()
		if AlduinRef.GetVoiceRecoveryTime() < 1 as Float
			if !AlduinRef.GetAnimationVariableBool("IsShouting") && DUTAlduinShoutToUse.GetValue() == 0 as Float && !attacker.IsDead()
				objectreference ShoutTargetRef = ShoutTarget.GetRef()
				ShoutTarget.ForceRefTo(attacker as objectreference)

				Bool canFirebreath = false
				Bool canFrostbreath = false
				Bool canUnrelentingForce = false
				Bool canDismay = false
				Bool canDisarm = false
				Bool canIceForm = false
				Bool canDevourSoul = false
				Bool canCrushWill = false

				; [Shout condition checks ... wie gehabt]
				; [Wurde ausgelassen, um Platz zu sparen. Die Bedingungen bleiben wie im Original.]

				; Auswahl der nutzbaren Shouts
				int[] validShouts = new int[8]
				int count = 0

				if canFirebreath
					validShouts[count] = 1
					count += 1
				endIf
				if canFrostbreath
					validShouts[count] = 2
					count += 1
				endIf
				if canUnrelentingForce
					validShouts[count] = 3
					count += 1
				endIf
				if canDismay
					validShouts[count] = 4
					count += 1
				endIf
				if canDisarm
					validShouts[count] = 5
					count += 1
				endIf
				if canIceForm
					validShouts[count] = 6
					count += 1
				endIf
				if canDevourSoul
					validShouts[count] = 7
					count += 1
				endIf
				if canCrushWill
					validShouts[count] = 8
					count += 1
				endIf

				if count > 0
					int randomIndex = Utility.RandomInt(0, count - 1)
					int selectedShout = validShouts[randomIndex]
					DUTAlduinShoutToUse.SetValue(selectedShout)

					; Apply global cooldown manually
					AlduinRef.SetVoiceRecoveryTime(6.0)

					AlduinRef.EvaluatePackage()
					self.UnregisterForUpdate()
					self.RegisterForSingleUpdate(FailsafeTime as Float)
				endIf
			endIf
		endIf
	endIf
endFunction

function OnInit()
	DUTAlduinShoutToUse.SetValue(0 as Float)
endFunction

function OnUpdate()
	actor AlduinRef = Alduin.GetActorRef()
	actor ShoutTargetRef = ShoutTarget.GetActorRef()
	if ShoutTargetRef == none || ShoutTargetRef.IsDead() || ShoutTargetRef.IsDisabled() || ShoutTargetRef.GetDistance(AlduinRef as objectreference) > 5000 as Float
		DUTAlduinShoutToUse.SetValue(0 as Float)
		AlduinRef.EvaluatePackage()
	elseIf !AlduinRef.GetAnimationVariableBool("IsShouting") && !AlduinRef.GetAnimationVariableBool("bWantCastVoice") && DUTAlduinShoutToUse.GetValue() != 0 as Float
		DUTAlduinShoutToUse.SetValue(0 as Float)
		AlduinRef.EvaluatePackage()
	else
		self.RegisterForSingleUpdate(0.5)
	endIf
endFunction
