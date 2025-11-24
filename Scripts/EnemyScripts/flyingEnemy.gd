class_name FlyingEnemy
extends CharacterBody3D

@onready var body: Node3D = $BatteryEye
@onready var hitbox: CollisionShape3D = $hitbox
@onready var stateMachine: stateManager = $stateManager

func _physics_process(delta: float) -> void:
	stateMachine.physics_process(delta)
	move_and_slide()
