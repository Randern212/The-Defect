class_name Projectile
extends Area3D

var direction:Vector3 = Vector3.ZERO
var source:Node

@export var speed:float=100
@export var dmg:float=10

func init(targetLayer:int,source:Node) -> void:
	set_collision_mask_value(targetLayer,true)
	self.source=source

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	pool()

func _physics_process(delta):
	self.global_position+=speed*direction.normalized()*delta

func pool():
	self.set_physics_process(false)
	self.set_deferred("monitorable",false)
	self.set_deferred("monitoring",false)
	self.visible=false

func _on_body_entered(body: Node2D) -> void:
	if get_collision_mask_value(1):
		if body.has_method("selfGotHit"):
			if is_instance_valid(source):
				body.selfGotHit(dmg,source)
	pool()

func unpool(shootingPosition:Vector3,direction:Vector3)->void:
	self.set_deferred("monitorable",true)
	self.set_deferred("monitoring",true)
	self.visible=true
	self.set_physics_process(true)
	self.global_position=shootingPosition
	self.direction=direction
