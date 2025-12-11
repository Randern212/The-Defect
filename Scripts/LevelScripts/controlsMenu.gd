extends Node2D

@onready var back: TextureButton = $Back

func _ready() -> void:
	back.pressed.connect(backToMainMenu)

func backToMainMenu()->void:
	get_tree().change_scene_to_file(Constants.sceneDictionary[Constants.Scenes.MAINMENU])
