class_name PlayerDetector
extends Area3D

signal playerDetected(body:Defect)
@export var coverageRange:float = 300.0

func bodyEntered(body: Node3D) -> void:
	if body is Defect:
		playerDetected.emit(body)
