class_name FlyingEnemy
extends CharacterBody3D

@onready var body: Node3D = $BatteryEye
@onready var hitbox: CollisionShape3D = $hitbox
@onready var stateMachine: stateManager = $stateManager
@onready var navigationAgent: NavigationAgent3D = $NavigationAgent
@onready var animations: AnimationPlayer = $animations
@onready var attackCooldown: Timer = $attackCooldown

var target:Defect=null
var direction:Vector3=Vector3.ZERO
var canShoot:bool=true

@export var bullet:PackedScene
@export var range:float=100
@export var speed:float=100

func _ready() -> void:
	stateMachine.init(self,Constants.enemyStates.IDLE)

func _process(delta: float) -> void:
	if target:
		navigationAgent.target_position=target.global_position

func _physics_process(delta: float) -> void:
	stateMachine.physics_process(delta)
	body.global_rotation.y = Vector3.BACK.signed_angle_to(direction,Vector3.UP)
	move_and_slide()

func inRange()->bool:
	if abs(global_position.distance_to(target.global_position))<=range:
		return true
	return false

func cooldownOff()->void:
	canShoot=true

func shoot()->void:
	var bulletInstance:Projectile=bullet.instantiate()
	bulletInstance.unpool(global_position,global_position.direction_to(target.global_position))
	attackCooldown.start(1.0)

func setTarget(body:Node3D):
	self.target=body
