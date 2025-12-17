extends Node2D

@onready var start: TextureButton = $Control/Start
@onready var controls: TextureButton = $Control/Controls
@onready var quit: TextureButton = $Control/Quit

func _ready() -> void:
	start.pressed.connect(startGame)
	controls.pressed.connect(showControls)
	quit.pressed.connect(quitGame)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func startGame()->void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().change_scene_to_file(Constants.sceneDictionary[Constants.Scenes.LEVEL1])

func showControls()->void:
	get_tree().change_scene_to_file(Constants.sceneDictionary[Constants.Scenes.CONTROLS])

func quitGame()->void:
	get_tree().quit()
