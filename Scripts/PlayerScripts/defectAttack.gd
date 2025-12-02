extends State


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.ID=Constants.playerStates.ATTACK

func enter():
	player.body.animations.play("Slash")
	turnHitbox(true)


func exit():
	turnHitbox(false)


func turnHitbox(On:bool):
	player.attackHitbox.monitoring=On
	player.attackHitbox.monitorable=On
