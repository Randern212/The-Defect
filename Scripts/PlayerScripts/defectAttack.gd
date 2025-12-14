extends State

var leftToRight:bool=true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.ID=Constants.playerStates.ATTACK

func enter()->void:
	if leftToRight:
		player.body.animations.play("Slash")
	else:
		player.body.animations.play_backwards("Slash")
	turnHitbox(true)


func exit()->void:
	turnHitbox(false)
	leftToRight = not leftToRight


func turnHitbox(On:bool)->void:
	player.attackHitbox.monitoring=On
	player.attackHitbox.monitorable=On
