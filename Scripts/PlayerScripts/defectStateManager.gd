extends stateManager

func forceIdle()->void:
	changeState(states[Constants.playerStates.IDLE])
