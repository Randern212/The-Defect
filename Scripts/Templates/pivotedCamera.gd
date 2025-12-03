class_name pivotedCamera
extends Node3D

var cameraInputDirection:Vector2=Vector2.ZERO

@export var camera: Camera3D
@export var cameraSpring:SpringArm3D
@export var cameraDistance:float=80
@export_range(0.0, 1.0) var mouseSensitiviy:float=0.25

func setCameraDistance(distance:float)->void:
	self.cameraSpring.spring_length = distance

func cameraMouseInput(event:InputEvent)->void:
	var isMoving:bool=(event is InputEventMouseMotion)
	if isMoving:
		cameraInputDirection=event.screen_relative*mouseSensitiviy

func handleCameraMotionProcessing(delta:float)->void:
	self.rotation.x-=clamp(cameraInputDirection.y*delta,-PI/6,PI/3)
	self.rotation.y-=clamp(cameraInputDirection.x*delta,-PI/6,PI/3)
	cameraInputDirection=Vector2.ZERO
