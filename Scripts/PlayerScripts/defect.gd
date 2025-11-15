class_name Defect
extends CharacterBody3D

@onready var stateMachine = $stateManager
@onready var camera: pivotedCamera = $pivotedCamera

@export var speed:float = 10
@export var acceleration:float = 20

func _ready()->void:
	stateMachine.init(self)

func _input(event: InputEvent) -> void:
	camera.cameraMouseInput(event)
	stateMachine.input(event)

func _physics_process(delta: float) -> void:
	camera.handleCameraMotionProcessing(delta)
	stateMachine.physics_process(delta)
	move_and_slide()
