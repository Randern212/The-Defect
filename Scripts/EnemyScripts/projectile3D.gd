class_name Projectile
extends Area3D

var direction:Vector3 = Vector3.ZERO
var source:Node
var notDeflected=false

@export var speed:float=200
@export var dmg:float=10

func init(targetLayer:int,source:Node) -> void:
	set_collision_mask_value(targetLayer,true)
	self.source=source

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	pool()

func _physics_process(delta):
	self.global_position+=speed*direction.normalized()*delta
	self.rotation.y = Vector3.RIGHT.signed_angle_to(direction,Vector3.UP)

func pool():
	self.set_physics_process(false)
	self.set_deferred("monitorable",false)
	self.set_deferred("monitoring",false)
	self.visible=false

func _on_body_entered(body: Node3D) -> void:
	if get_collision_mask_value(1):
		if body.has_method("selfGotHit"):
			body.selfGotHit(dmg,self)
	if notDeflected:
		pool()

func unpool(shootingPosition:Vector3,direction:Vector3)->void:
	self.set_deferred("monitorable",true)
	self.set_deferred("monitoring",true)
	self.visible=true
	self.set_physics_process(true)
	self.global_position=shootingPosition
	self.direction = direction

func deflected():
	self.direction=self.global_position.direction_to(source.global_position+Vector3(0,15,0))
	notDeflected=false
