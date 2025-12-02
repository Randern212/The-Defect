extends State


func _ready() -> void:
	ID=Constants.enemyStates.CHASE

func enter():
	player.animations.play("Moving")

func physics_process(delta: float)->int:
	if player.inRange():
		return Constants.enemyStates.ATTACK
	if player.target:
		var destination = player.navigationAgent.get_next_path_position()
		var localDestination = destination-player.global_position
		player.direction = localDestination.normalized()
		player.velocity=player.speed*player.direction
		return ID
	return Constants.enemyStates.IDLE
