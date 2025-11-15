class_name State
extends Node

var ID:int
var player:CharacterBody3D

func _ready() -> void:
	pass # Replace with function body.

func input(event: InputEvent) -> int:
	return ID

func exit():
	pass

func enter():
	pass

func physics_process(delta: float)->int:
	return ID
