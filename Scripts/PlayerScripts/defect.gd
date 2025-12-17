class_name Defect
extends CharacterBody3D

@onready var stateMachine:stateManager = $stateManager
@onready var camera: pivotedCamera = $pivotedCamera
@onready var body: defectModel = $TheDefect
@onready var collider: CollisionShape3D = $CollisionShape3D
@onready var attackHitbox: Area3D = $attackhitbox
@onready var dashTimer: Timer = $dashTimer
@onready var deflectTimer: Timer = $deflectTimer
@onready var hud: playerHUD = $playerHUD

var attackOffset:float=18.184
var direction:Vector3=Vector3.ZERO
var forward:Vector3=Vector3.ZERO
var right:Vector3=Vector3.ZERO
var deflecting=false

var canDeflect:bool=true
var canDash:bool=true

@export var speed:float = 120
@export var acceleration:float = 150
@export var jumpForce:float = 180
@export var gravity:float=-300

func _ready()->void:
	stateMachine.init(self,Constants.playerStates.FALL)
	hud.playerDied.connect(seppuku)

func _input(event: InputEvent) -> void:
	camera.cameraMouseInput(event)
	stateMachine.input(event)

func _physics_process(delta: float) -> void:
	camera.handleCameraMotionProcessing(delta)
	stateMachine.physics_process(delta)
	body.global_rotation.y = Vector3.BACK.signed_angle_to(direction,Vector3.UP)
	attackHitbox.position = attackOffset * direction.normalized()
	attackHitbox.position.y=attackOffset
	move_and_slide()

func getDirection()->void:
	var rawInput:Vector2=Input.get_vector("moveLeft","moveRight","moveUp","moveDown")
	forward=camera.camera.global_basis.z
	right=camera.camera.global_basis.x
	direction=rawInput.y*forward+rawInput.x*right
	direction.y=0
	direction.normalized()

func hitSomething(thing:Node3D)->void:
	if thing.has_method("selfGotHit") and not thing is Defect:
		thing.selfGotHit(10,self)

func selfGotHit(dmg:float,thing:Node3D)->void:
	if deflecting:
		body.animations.play("Deflect")
		if thing.has_method("deflected"):
			thing.deflected()
			canDeflect = true
	else:
		if thing.has_method("pool"):
			thing.pool()
		hud.changeValue(-dmg)

func seppuku()->void:
	self.visible=false
	self.set_physics_process(false)
	self.set_process_input(false)
	hud.showMessage("Defect Eliminated")

func levelWon()->void:
	hud.showMessage("Escape Successful")
