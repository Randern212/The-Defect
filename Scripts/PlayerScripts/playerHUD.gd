class_name playerHUD
extends Control

@onready var hp: TextureProgressBar = $HP
@onready var deathScreen: Sprite2D = $DeathScreen
@onready var playerDead:bool=false
@onready var deathMessage: Label = $DeathScreen/DeathMessage

signal playerDied

@export var tweenDuration:float=0.75


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Reset") and playerDead:
		get_tree().change_scene_to_file(Constants.sceneDictionary[Constants.Scenes.MAINMENU])

func changeValue(value:float)->void:
	var tween=create_tween()
	tween.tween_property(hp,"value",hp.value+value,tweenDuration)
	if hp.value<=hp.min_value:
		showMessage("Defeect Eliminated")

func showMessage(message:String):
	deathMessage.text=message
	var deathTween=create_tween()
	deathTween.tween_property(deathScreen,"modulate:a",1,1.5)
	playerDead=true
	playerDied.emit()
