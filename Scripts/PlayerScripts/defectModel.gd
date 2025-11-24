class_name defectModel
extends Node3D

signal animationFinished(animationName)

@onready var animations: AnimationPlayer = $AnimationPlayer
@onready var coat: SoftBody3D = $Coat

func finished(animationName):
	animationFinished.emit(animationName)
