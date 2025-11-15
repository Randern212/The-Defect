class_name stateManager
extends Node

var currentState:State
var player:CharacterBody3D
var states:Dictionary

func init(player:CharacterBody3D,initialState:int)->void:
	self.player=player
	for child in get_children():
		if child is State:
			child.player=player
			states[child.ID]=child
	currentState=states[initialState]

func input(event:InputEvent)->void:
	var newStateID=currentState.input(event)
	if not newStateID==currentState.ID:
		changeState(states[newStateID])

func changeState(newState:State)->void:
	if currentState:
		currentState.exit()
	currentState=newState
	currentState.enter()

func physics_process(delta: float) -> void:
	var newStateID=currentState.physics_process(delta)
	if not newStateID==currentState.ID:
		changeState(states[newStateID])
