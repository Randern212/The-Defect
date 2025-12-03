extends State

@export var deflectCD:float=0.9

func _ready() -> void:
	ID=Constants.playerStates.DEFLECT

func enter()->void:
	player.body.animations.play("Attack")
	player.deflecting = true
	player.canDeflect=false
	player.deflectTimer.start(deflectCD)

func exit()->void:
	player.deflecting=false

func resetDeflectBool()->void:
	player.canDeflect=true
