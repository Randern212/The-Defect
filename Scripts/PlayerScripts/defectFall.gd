extends State


func _ready() -> void:
	self.ID=Constants.playerStates.FALL

func input(event: InputEvent) -> int:
	if Input.is_action_pressed("dash") and player.canDash:
		return Constants.playerStates.DASH
	return ID

func enter()->void:
	player.body.animations.play("Jump")

func physics_process(delta: float)->int:
	if player.is_on_floor():
		return Constants.playerStates.IDLE
	player.getDirection()
	player.velocity=player.velocity.move_toward(player.direction,delta*player.acceleration)
	player.velocity.y+=player.gravity*delta
	return ID
