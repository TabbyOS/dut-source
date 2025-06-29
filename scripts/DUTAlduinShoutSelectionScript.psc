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
				
				if DUTAlduinAIEnableFirebreath.GetValue() != 0 as Float
					if !AlduinRef.HasMagicEffect(VoiceAlduinFirebreathCooldownEffect)
						if AlduinRef.GetDistance(attacker as objectreference) <= FirebreathMaxRange as Float
							if AlduinRef.GetHeadingAngle(attacker as objectreference) < TurningLimit as Float && AlduinRef.GetHeadingAngle(attacker as objectreference) > (-TurningLimit) as Float
								canFirebreath = true
							endIf
						endIf
					endIf
				endIf
				
				if DUTAlduinAIEnableFrostbreath.GetValue() != 0 as Float
					if !AlduinRef.HasMagicEffect(VoiceAlduinFrostbreathCooldownEffect)
						if AlduinRef.GetDistance(attacker as objectreference) <= FrostbreathMaxRange as Float
							if AlduinRef.GetHeadingAngle(attacker as objectreference) < TurningLimit as Float && AlduinRef.GetHeadingAngle(attacker as objectreference) > (-TurningLimit) as Float
								canFrostbreath = true
							endIf
						endIf
					endIf
				endIf
				
				if DUTAlduinAIEnableUnrelentingForce.GetValue() != 0 as Float
					if !AlduinRef.HasMagicEffect(VoiceAlduinUnrelentingForceCooldownEffect)
						if AlduinRef.GetDistance(attacker as objectreference) <= UnrelentingForceMaxRange as Float
							if AlduinRef.GetHeadingAngle(attacker as objectreference) < TurningLimit as Float && AlduinRef.GetHeadingAngle(attacker as objectreference) > (-TurningLimit) as Float
								canUnrelentingForce = true
							endIf
						endIf
					endIf
				endIf
				
				if DUTAlduinAIEnableDismay.GetValue() != 0 as Float
					if !AlduinRef.HasMagicEffect(VoiceAlduinDismayCooldownEffect)
						if AlduinRef.GetDistance(attacker as objectreference) <= DismayMaxRange as Float
							if AlduinRef.GetHeadingAngle(attacker as objectreference) < TurningLimit as Float && AlduinRef.GetHeadingAngle(attacker as objectreference) > (-TurningLimit) as Float
								canDismay = true
							endIf
						endIf
					endIf
				endIf
				
				if DUTAlduinAIEnableDisarm.GetValue() != 0 as Float
					if !AlduinRef.HasMagicEffect(VoiceAlduinDisarmCooldownEffect)
						if AlduinRef.GetDistance(attacker as objectreference) <= DisarmMaxRange as Float
							if AlduinRef.GetHeadingAngle(attacker as objectreference) < TurningLimit as Float && AlduinRef.GetHeadingAngle(attacker as objectreference) > (-TurningLimit) as Float
								canDisarm = true
							endIf
						endIf
					endIf
				endIf
				
				if DUTAlduinAIEnableIceForm.GetValue() != 0 as Float
					if !AlduinRef.HasMagicEffect(VoiceAlduinIceFormCooldownEffect)
						if AlduinRef.GetDistance(attacker as objectreference) <= IceFormMaxRange as Float
							if AlduinRef.GetHeadingAngle(attacker as objectreference) < TurningLimit as Float && AlduinRef.GetHeadingAngle(attacker as objectreference) > (-TurningLimit) as Float
								canIceForm = true
							endIf
						endIf
					endIf
				endIf
				
				if DUTAlduinAIEnableDevourSoul.GetValue() != 0 as Float
					if !AlduinRef.HasMagicEffect(VoiceAlduinDevourSoulCooldownEffect)
						if AlduinRef.GetDistance(attacker as objectreference) <= DevourSoulMaxRange as Float
							if AlduinRef.GetHeadingAngle(attacker as objectreference) < TurningLimit as Float && AlduinRef.GetHeadingAngle(attacker as objectreference) > (-TurningLimit) as Float
								canDevourSoul = true
							endIf
						endIf
					endIf
				endIf
				
				if DUTAlduinAIEnableCrushWill.GetValue() != 0 as Float
					if !AlduinRef.HasMagicEffect(VoiceAlduinCrushWillCooldownEffect)
						if AlduinRef.GetDistance(attacker as objectreference) <= CrushWillMaxRange as Float
							if AlduinRef.GetHeadingAngle(attacker as objectreference) < TurningLimit as Float && AlduinRef.GetHeadingAngle(attacker as objectreference) > (-TurningLimit) as Float
								canCrushWill = true
							endIf
						endIf
					endIf
				endIf
				
				if canDismay && canUnrelentingForce
					if Utility.RandomInt(0, 100) < 35
						canIceForm = false
					endIf
				endIf
				
				if (canDismay || canUnrelentingForce) && canDevourSoul
					if Utility.RandomInt(0, 100) < 20
						canDevourSoul = false
						canUnrelentingForce = false
					endIf
				endIf
				
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
	if ShoutTargetRef == none
		DUTAlduinShoutToUse.SetValue(0 as Float)
		AlduinRef.EvaluatePackage()
	elseIf ShoutTargetRef.IsDead() || ShoutTargetRef.IsDisabled()
		DUTAlduinShoutToUse.SetValue(0 as Float)
		AlduinRef.EvaluatePackage()
	elseIf !AlduinRef.GetAnimationVariableBool("IsShouting") && !AlduinRef.GetAnimationVariableBool("bWantCastVoice") && DUTAlduinShoutToUse.GetValue() != 0 as Float
		DUTAlduinShoutToUse.SetValue(0 as Float)
		AlduinRef.EvaluatePackage()
	elseIf ShoutTargetRef.GetDistance(AlduinRef as objectreference) > 5000 as Float
		DUTAlduinShoutToUse.SetValue(0 as Float)
		AlduinRef.EvaluatePackage()
	else
		self.RegisterForSingleUpdate(0.5)
	endIf
endFunction