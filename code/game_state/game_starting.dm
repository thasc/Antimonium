/datum/game_state/starting
	ident = GAME_STARTING

/datum/game_state/starting/Start()
	SwitchGameState(/datum/game_state/running)

/datum/game_state/starting/End()
	to_chat(world, "<b>The game is starting!</b>")

/datum/game_state/starting/OnLogin(var/client/player)
	to_chat(world, "<b>The game is starting!</b>")
