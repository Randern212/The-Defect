extends State


func _ready() -> void:
	self.ID = Constants.playerStates.IDLE

func enter():
	print("IDLE")

func input(event: InputEvent) -> int:
	if Input.is_action_pressed("moveDown") or Input.is_action_pressed("moveLeft") or Input.is_action_pressed("moveRight") or Input.is_action_pressed("moveUp"):
		return Constants.playerStates.RUN
	return self.ID

func physics_process(delta: float)->int:
	if not player.is_on_floor():
		return Constants.playerStates.FALL
	return self.ID
