class_name playerHUD
extends Control

@onready var hp: TextureProgressBar = $HP
@onready var deathScreen: Sprite2D = $DeathScreen
@onready var playerDead:bool=false

signal playerDied

@export var tweenDuration:float=0.75


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Reset") and playerDead:
		get_tree().change_scene_to_file(Constants.sceneDictionary[Constants.Scenes.MAINMENU])


func changeValue(value:float)->void:
	var tween=create_tween()
	tween.tween_property(hp,"value",hp.value+value,tweenDuration)
	if hp.value<=hp.min_value:
		playerDead=true
		playerDied.emit()
		var deathTween=create_tween()
		deathTween.tween_property(deathScreen,"modulate:a",1,1.5)
