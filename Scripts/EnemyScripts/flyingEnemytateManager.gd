extends stateManager

func forceChangeState(stateName:StringName):
	if stateName=="attack":
		changeState(states[Constants.enemyStates.IDLE])
