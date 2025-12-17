class_name KillBox
extends Area3D

func killPlayer(body:Node3D)->void:
	if body is Defect:
		body.seppuku()
