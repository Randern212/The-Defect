class_name playerHUD
extends Control

@onready var hp: TextureProgressBar = $HP

signal playerDied

@export var tweenDuration:float=0.75

func changeValue(value:float)->void:
	var tween=create_tween()
	tween.tween_property(hp,"value",hp.value+value,tweenDuration)
	if hp.value<=hp.min_value:
		playerDied.emit()
