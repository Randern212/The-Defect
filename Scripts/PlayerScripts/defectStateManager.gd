extends stateManager

func init(player:CharacterBody3D,initialState:int)->void:
	super(player,initialState)
	player.body.animationFinished.connect(forceChangeState)

func forceChangeState(stateName:StringName)->void:
	if stateName=="Slash" or stateName=="Attack" or stateName=="Deflect":
		forceIdle()

func forceIdle()->void:
	changeState(states[Constants.playerStates.IDLE])
