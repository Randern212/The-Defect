extends State

func _ready() -> void:
	self.ID=Constants.playerStates.JUMP

func enter():
	player.velocity.y+=player.jumpForce

func physics_process(delta: float)->int:
	player.getDirection()
	player.velocity=player.velocity.move_toward(player.direction,delta*player.acceleration)
	player.velocity.y+=player.gravity*delta
	
	if player.velocity.y>=0:
		return Constants.playerState.FALL
	if player.is_on_floor():
		return Constants.playerState.IDLE
	return ID
