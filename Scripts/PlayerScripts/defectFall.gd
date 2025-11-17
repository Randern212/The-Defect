extends State


func _ready() -> void:
	self.ID=Constants.playerStates.FALL

func enter():
	print("FALL")

func physics_process(delta: float)->int:
	if player.is_on_floor():
		return Constants.playerStates.IDLE
	player.getDirection()
	player.velocity=player.velocity.move_toward(player.direction,delta*player.acceleration)
	player.velocity.y+=player.gravity*delta
	return ID
