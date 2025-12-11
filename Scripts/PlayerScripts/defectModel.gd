class_name defectModel
extends Node3D

signal animationFinished(animationName)

@onready var animations: AnimationPlayer = $AnimationPlayer
@onready var coat: MeshInstance3D = $Coat

func finished(animationName)->void:
	animationFinished.emit(animationName)
