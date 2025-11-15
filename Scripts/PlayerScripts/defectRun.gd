extends State

var direction:Vector3=Vector3.ZERO
var forward:Vector3=Vector3.ZERO
var right:Vector3=Vector3.ZERO

func _ready() -> void:
	self.ID=Constants.playerStates.RUN

func physics_process(delta: float) -> int:
	if not player.is_on_floor():
		return Constants.playerStates.FALL
	getDirection()
	player.velocity=player.velocity.move_toward(direction,delta*player.acceleration)
	return ID

func getDirection()->void:
	var rawInput:Vector2=Input.get_vector("moveLeft","moveRight","moveUp","moveDown")
	forward=player.camera.camera.global_basis.z
	right=player.camera.camera.global_basis.x
	direction=rawInput.y*forward+rawInput.x*right
	direction.y=0
	direction.normalized()
