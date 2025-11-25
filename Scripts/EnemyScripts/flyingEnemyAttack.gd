extends State


func _ready() -> void:
	ID=Constants.enemyStates.ATTACK

func enter():
	player.animations.play("attack")

func exit():
	player.shoot()
