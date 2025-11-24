extends stateManager

func init(player:CharacterBody3D,initialState:int)->void:
	super(player,initialState)
	player.body.animationFinished.connect(forceChangeState)

func forceChangeState(stateName:String):
	if stateName=="Slash":
		forceIdle()

func forceIdle()->void:
	changeState(states[Constants.playerStates.IDLE])
