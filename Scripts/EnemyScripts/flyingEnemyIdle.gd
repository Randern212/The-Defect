extends State


func _ready() -> void:
	ID=Constants.enemyStates.IDLE

func enter():
	player.animations.play("IdleHovering")
