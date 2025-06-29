; DUT_DebugLogger.psc
; Logs messages to the Papyrus log with optional script-specific tags and control over verbosity

Scriptname DebugLogger extends Quest

; === CONFIGURATION ===
Bool Property EnableLogging = True Auto  ; Toggle logging globally
Bool Property EnableVerbose = False Auto ; Toggle verbose logging (more detailed output)
String Property Prefix = "[DebugLogger]" Auto ; Prefix added to all log entries for identification

; === LOGGING METHODS ===
Function Log(String message, String sourceTag = "", Bool isVerbose = False)
	if !EnableLogging
		return
	endIf

	if isVerbose && !EnableVerbose
		return
	endIf

	String finalMessage = Prefix + (sourceTag != "" ? "[" + sourceTag + "] " : " ") + message
	Debug.Trace(finalMessage)
EndFunction

Function LogWarning(String message, String sourceTag = "")
	if !EnableLogging
		return
	endIf
	Debug.Trace(Prefix + (sourceTag != "" ? "[" + sourceTag + "] " : " ") + "[WARNING] " + message)
EndFunction

Function LogError(String message, String sourceTag = "")
	if !EnableLogging
		return
	endIf
	Debug.Trace(Prefix + (sourceTag != "" ? "[" + sourceTag + "] " : " ") + "[ERROR] " + message)
EndFunction

Function LogScriptStart(String scriptName)
	Log("Initializing script...", scriptName, True)
EndFunction

Function LogScriptEnd(String scriptName)
	Log("Script finished.", scriptName, True)
EndFunction