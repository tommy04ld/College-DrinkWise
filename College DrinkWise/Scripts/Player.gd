extends RigidBody2D

class_name Player

signal died

export var FLAP_Force = -225
onready var animator = $AnimationPlayer
var started = false
var alive = true
const Max_Rotation_Degrees = -25

func _physics_process(delta):
	if Input.is_action_just_pressed("flap") && alive:
		if !started:
			start()
		flap()
	
	#Rotation while moving up
	if rotation_degrees <= Max_Rotation_Degrees:
		angular_velocity = 0
		rotation_degrees = Max_Rotation_Degrees
	
	#Rotation While falling
	if linear_velocity.y > 0:
		if rotation_degrees <= 100:
			angular_velocity = 2
		else:
			angular_velocity = 0
	
func start():
	if started: return
	started = true
	gravity_scale = 5.0
	animator.play("flap")

func flap():
	linear_velocity.y = FLAP_Force
	angular_velocity = -8

func die():
	if !alive:return
	alive = false
	animator.stop()
	emit_signal("died")
