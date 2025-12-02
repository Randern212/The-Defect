class_name Defect
extends CharacterBody3D

@onready var stateMachine:stateManager = $stateManager
@onready var camera: pivotedCamera = $pivotedCamera
@onready var body: defectModel = $TheDefect
@onready var collider: CollisionShape3D = $CollisionShape3D
@onready var attackHitbox: Area3D = $attackhitbox

var attackOffset:float=18.184
var direction:Vector3=Vector3.ZERO
var forward:Vector3=Vector3.ZERO
var right:Vector3=Vector3.ZERO
var deflecting=false

@export var speed:float = 300
@export var acceleration:float = 150
@export var jumpForce:float = 180
@export var gravity:float=-300

func _ready()->void:
	stateMachine.init(self,Constants.playerStates.FALL)

func _unhandled_input(event: InputEvent) -> void:
	camera.cameraMouseInput(event)
	stateMachine.input(event)

func _physics_process(delta: float) -> void:
	camera.handleCameraMotionProcessing(delta)
	stateMachine.physics_process(delta)
	body.global_rotation.y = Vector3.BACK.signed_angle_to(direction,Vector3.UP)
	attackHitbox.position = attackOffset * direction.normalized()
	move_and_slide()

func getDirection()->void:
	var rawInput:Vector2=Input.get_vector("moveLeft","moveRight","moveUp","moveDown")
	forward=camera.camera.global_basis.z
	right=camera.camera.global_basis.x
	direction=rawInput.y*forward+rawInput.x*right
	direction.y=0
	direction.normalized()

func hitSomething(thing:Node3D)->void:
	if thing.has_method("gotHit"):
		thing.gotHit()

func gotHit(thing:Node3D):
	if deflecting:
		body.animations.play("Deflect")
		if thing.has_method("deflected"):
			thing.deflected()
	else:
		print("get baaaaad")
