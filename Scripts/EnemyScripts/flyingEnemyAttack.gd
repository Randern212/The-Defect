extends State


func _ready() -> void:
	ID=Constants.enemyStates.ATTACK

func enter():
	player.animations.play("attack")
	player.velocity=Vector3.ZERO

func exit():
	player.shoot()
