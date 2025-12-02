extends State

func _ready() -> void:
	ID=Constants.playerStates.DEFLECT

func enter():
	player.body.animations.play("Attack")
	player.deflecting = true

func exit():
	player.deflecting=false
