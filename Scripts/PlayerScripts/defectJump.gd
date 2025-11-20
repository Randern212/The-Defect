extends State

func _ready() -> void:
	self.ID=Constants.playerStates.JUMP

func enter():
	player.velocity.y+=player.jumpForce
	print("JUMP")

func physics_process(delta: float)->int:
	player.getDirection()
	player.velocity=player.velocity.move_toward(player.direction,delta*player.acceleration)
	player.velocity.y+=player.gravity*delta
	if player.is_on_floor():
		return Constants.playerStates.IDLE
	return ID
