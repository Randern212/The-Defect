extends State


func _ready() -> void:
	ID=Constants.enemyStates.IDLE

func enter():
	player.animations.play("IdleHovering")
	player.velocity=Vector3.ZERO

func physics_process(delta: float)->int:
	if player.target:
		return Constants.enemyStates.CHASE
	return ID
