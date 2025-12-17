extends Node2D

@onready var back: TextureButton = $Back

func _ready() -> void:
	back.pressed.connect(backToMainMenu)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func backToMainMenu()->void:
	get_tree().change_scene_to_file(Constants.sceneDictionary[Constants.Scenes.MAINMENU])
