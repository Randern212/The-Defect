class_name FlyingEnemy
extends CharacterBody3D

@onready var body: Node3D = $BatteryEye
@onready var hitbox: CollisionShape3D = $hitbox
@onready var stateMachine: stateManager = $stateManager
@onready var navigationAgent: NavigationAgent3D = $NavigationAgent
@onready var animations: AnimationPlayer = $animations

var target:Defect=null
var direction:Vector3=Vector3.ZERO

func _process(delta: float) -> void:
	if target:
		navigationAgent.target_position=target.global_position

func _physics_process(delta: float) -> void:
	stateMachine.physics_process(delta)
	move_and_slide()

func inRange()->bool:
	return false
