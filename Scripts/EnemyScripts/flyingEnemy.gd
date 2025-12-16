class_name FlyingEnemy
extends CharacterBody3D

@onready var body: Node3D = $BatteryEye
@onready var hitbox: CollisionShape3D = $hitbox
@onready var stateMachine: stateManager = $stateManager
@onready var navigationAgent: NavigationAgent3D = $NavigationAgent
@onready var animations: AnimationPlayer = $animations
@onready var attackCooldown: Timer = $attackCooldown
@onready var shield: MeshInstance3D = $Shield

var target:Defect=null
var direction:Vector3=Vector3.ZERO
var canShoot:bool=true
var bulletInstance:Projectile
var shootingPosition:Vector3=Vector3(6.582,10.956,0)
var hp:int=20

@export var shieldActive:bool=true
@export var bullet:PackedScene
@export var range:float=100
@export var speed:float=100
@export var ID:int=-1

func _ready() -> void:
	stateMachine.init(self,Constants.enemyStates.IDLE)
	bulletInstance=bullet.instantiate()
	bulletInstance.init(1,self)
	bulletInstance.pool()
	self.get_parent().add_child.call_deferred(bulletInstance)

func _process(delta: float) -> void:
	if target:
		navigationAgent.target_position=target.global_position

func _physics_process(delta: float) -> void:
	if target:
		var destination = navigationAgent.get_next_path_position()
		var localDestination = destination-global_position
		direction = localDestination.normalized()
	self.rotation.y = Vector3.RIGHT.signed_angle_to(direction,Vector3.UP)
	stateMachine.physics_process(delta)
	move_and_slide()

func inRange()->bool:
	if abs(global_position.distance_to(target.global_position))<=range:
		return true
	return false

func cooldownOff()->void:
	canShoot=true

func shoot()->void:
	bulletInstance.unpool(global_position + shootingPosition,global_position.direction_to(target.global_position))
	attackCooldown.start(1.0)

func setTarget(body:Node3D)->void:
	self.target=body

func selfGotHit(dmg,source:Node)->void:
	if shieldActive and source is Projectile:
		shieldActive=false
		shield.visible=false
	elif not shieldActive:
		hp-=dmg
		print("dmg")
		if hp<=0:
			self.queue_free()
	if source.has_method("pool"):
		source.pool()
