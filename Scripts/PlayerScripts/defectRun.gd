extends State


func _ready() -> void:
	self.ID=Constants.playerStates.RUN

func input(event: InputEvent) -> int:
	return ID

func physics_process(delta: float) -> int:
	if not player.is_on_floor():
		return Constants.playerStates.FALL
	player.getDirection()
	if player.direction==Vector3.ZERO and player.is_on_floor():
		return Constants.playerStates.IDLE
	player.velocity=player.velocity.move_toward(player.direction,delta*player.acceleration)
	return ID
