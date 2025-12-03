extends State

@export var dashSpeed:float=500
@export var dashDuration:float=0.25

var dashDirection:Vector3=Vector3.ZERO
var dashCD:float=0.3

signal dashFinished

func _ready() -> void:
	self.ID=Constants.playerStates.DASH

func enter()->void:
	dashDirection=player.direction
	player.body.animations.play("Running_001")
	var freeTimer:Timer=Timer.new()
	add_child(freeTimer)
	freeTimer.timeout.connect(dashFinished.emit)
	freeTimer.timeout.connect(freeTimer.queue_free)
	freeTimer.start(dashDuration)
	player.canDash=false
	player.dashTimer.start(dashCD)
	
func physics_process(delta: float)->int:
	delta*=1.5
	player.velocity=dashSpeed*dashDirection
	player.velocity.y=0
	return ID

func exit()->void:
	player.velocity=Vector3.ZERO

func resetDashBool()->void:
	player.canDash=true
