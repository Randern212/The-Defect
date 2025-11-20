class_name Defect
extends CharacterBody3D

@onready var stateMachine:stateManager = $stateManager
@onready var camera: pivotedCamera = $pivotedCamera
@onready var body: Node3D = $TheDefect
@onready var collider: CollisionShape3D = $CollisionShape3D

var direction:Vector3=Vector3.ZERO
#var forward:Vector3=Vector3.ZERO
#var right:Vector3=Vector3.ZERO

@export var speed:float = 300
@export var acceleration:float = 150
@export var jumpForce:float = 120
@export var gravity:float=-300

func _ready()->void:
	stateMachine.init(self,Constants.playerStates.FALL)

func _unhandled_input(event: InputEvent) -> void:
	camera.cameraMouseInput(event)
	stateMachine.input(event)

func _physics_process(delta: float) -> void:
	camera.handleCameraMotionProcessing(delta)
	stateMachine.physics_process(delta)
	move_and_slide()

func getDirection()->void:
	var rawInput:Vector2=Input.get_vector("moveLeft","moveRight","moveUp","moveDown")
	var forward=camera.camera.global_basis.z
	var right=camera.camera.global_basis.x
	direction=rawInput.y*forward+rawInput.x*right
	direction.y=0
	direction.normalized()
