extends State


func _ready() -> void:
	ID=Constants.enemyStates.CHASE

func enter():
	player.animations.play("Moving")

func physics_process(delta: float)->int:
	if player.inRange():
		return Constants.enemyStates.ATTACK
	if player.target:
		player.velocity=player.speed*player.direction
		return ID
	return Constants.enemyStates.IDLE
