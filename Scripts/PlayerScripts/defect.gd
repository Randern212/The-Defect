class_name Defect
extends CharacterBody3D

@onready var stateMachine = $stateManager
@onready var camera: pivotedCamera = $pivotedCamera

@export var speed:float = 10
@export var acceleration:float = 20

var direction:Vector3=Vector3.ZERO
var forward:Vector3=Vector3.ZERO
var right:Vector3=Vector3.ZERO

@export var jumpForce:float = 1200
@export var gravity:float=-300
@onready var Body: Node3D = $TheDefect

func _ready()->void:
	stateMachine.init(self,Constants.playerStates.IDLE)

func _unhandled_input(event: InputEvent) -> void:
	camera.cameraMouseInput(event)
	stateMachine.input(event)

func _physics_process(delta: float) -> void:
	camera.handleCameraMotionProcessing(delta)
	stateMachine.physics_process(delta)
	move_and_slide()

func getDirection()->void:
	var rawInput:Vector2=Input.get_vector("moveLeft","moveRight","moveUp","moveDown")
	forward=camera.camera.global_basis.z
	right=camera.camera.global_basis.x
	direction=rawInput.y*forward+rawInput.x*right
	direction.y=0
	direction.normalized()
