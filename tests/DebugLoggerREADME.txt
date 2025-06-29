Usage in the main script
Add property:

"Alduin_DebugLogger Property Logger Auto"

Example application:

Logger.Log("SelectShouts triggered.")
Logger.LogWithActor("Alduin target acquired", attacker)
Logger.LogInt("Selected shout ID", selectedShout)
Logger.LogBool("canDevourSoul", canDevourSoul)

Notes:
The script is modular - you can also add LogArray() or LogVector() later.

If you set DebugMode to False in the Creation Kit, nothing will be logged - ideal for release versions.

You can change the prefix if you have several loggers in use (e.g. for different NPCs or systems).