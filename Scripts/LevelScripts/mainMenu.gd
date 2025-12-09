extends Node2D

@onready var start: TextureButton = $Control/Start
@onready var controls: TextureButton = $Control/Controls
@onready var quit: TextureButton = $Control/Quit

func _ready() -> void:
	start.pressed.connect(startGame)
	controls.pressed.connect(showControls)
	quit.pressed.connect(quitGame)

func startGame()->void:
	get_tree().change_scene_to_file(Constants.sceneDictionary[Constants.Scenes.NAVIGATIONDEMO])

func showControls()->void:
#	get_tree().change_scene_to_file(Constants.sceneDictionary[Constants.Scenes.CONTROLS])
	pass
	
func quitGame()->void:
	get_tree().quit()
