extends State

var jumping=false

func _ready() -> void:
	self.ID=Constants.playerStates.RUN

func enter():
	player.body.animations.play("Running_001")
	jumping=false

func input(event: InputEvent) -> int:
	if Input.is_action_pressed("jump"):
		jumping=true
		return Constants.playerStates.JUMP
	if Input.is_action_pressed("moveDown") or Input.is_action_pressed("moveLeft") or Input.is_action_pressed("moveRight") or Input.is_action_pressed("moveUp"):
		return ID
	return Constants.playerStates.IDLE

func physics_process(delta: float) -> int:
	player.getDirection()
	if not player.is_on_floor():
		return Constants.playerStates.FALL
	if player.direction==Vector3.ZERO and player.is_on_floor():
		return Constants.playerStates.IDLE
	player.velocity=player.velocity.move_toward(player.direction*player.speed,delta*player.acceleration)
	return ID

func exit():
	if not jumping:
		player.velocity=Vector3.ZERO
