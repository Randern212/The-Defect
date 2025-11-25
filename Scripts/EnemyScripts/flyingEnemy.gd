class_name FlyingEnemy
extends CharacterBody3D

@onready var body: Node3D = $BatteryEye
@onready var hitbox: CollisionShape3D = $hitbox
@onready var stateMachine: stateManager = $stateManager
@onready var navigationAgent: NavigationAgent3D = $NavigationAgent
@onready var animations: AnimationPlayer = $animations

var player:Defect=null
var direction:Vector3=Vector3.ZERO

func _process(delta: float) -> void:
	if player:
		navigate(player.global_position)

func _physics_process(delta: float) -> void:
	var destination = navigationAgent.get_next_path_position()
	var localDestination=destination-global_position
	var direction=localDestination.normalized()
	stateMachine.physics_process(delta)
	move_and_slide()

func navigate(targetPosition:Vector3)->void:
	navigationAgent.target_position=targetPosition
