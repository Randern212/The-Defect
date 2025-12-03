extends State

func _ready() -> void:
	self.ID = Constants.playerStates.IDLE

func enter()->void:
	player.body.animations.play("Idle")

func input(event: InputEvent) -> int:
	if Input.is_action_pressed("attack"):
		return Constants.playerStates.ATTACK
	if Input.is_action_pressed("deflect") and player.canDeflect:
		return Constants.playerStates.DEFLECT
	if Input.is_action_pressed("dash") and player.canDash:
		return Constants.playerStates.DASH
	if Input.is_action_pressed("jump"):
		return Constants.playerStates.JUMP
	if abs(Input.get_vector("moveLeft","moveRight","moveUp","moveDown")) > Vector2.ZERO:
		return Constants.playerStates.RUN
	return self.ID

func physics_process(delta: float)->int:
	if not player.is_on_floor():
		return Constants.playerStates.FALL
	return self.ID
