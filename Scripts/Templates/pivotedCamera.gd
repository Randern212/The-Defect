class_name pivotedCamera
extends Node3D

@export var camera: Camera3D

@export var cameraDistance:float=80

func setCameraDistance(distance:float)->void:
	self.camera.position.z=cameraDistance*-1
