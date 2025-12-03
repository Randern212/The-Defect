extends State

func _ready() -> void:
	self.ID=Constants.playerStates.JUMP


func input(event: InputEvent) -> int:
	if Input.is_action_pressed("dash") and player.canDash:
		return Constants.playerStates.DASH
	return ID

func enter()->void:
	player.velocity.y+=player.jumpForce
	player.body.animations.play("Jump")

func physics_process(delta: float)->int:
	player.getDirection()
	player.velocity=player.velocity.move_toward(player.direction,delta*player.acceleration)
	player.velocity.y+=player.gravity*delta
	if player.is_on_floor() and player.velocity.y<=0:
		return Constants.playerStates.IDLE
	return ID
