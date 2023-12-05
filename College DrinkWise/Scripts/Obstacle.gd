extends Node2D

signal score
const SPEED = 250


func _physics_process(delta):
	position.x += -SPEED * delta
	if global_position.x <= -200:
		queue_free()
		

var rng = RandomNumberGenerator.new()
var run = true

func _process(delta):
	if run:
		rng.seed = Time.get_ticks_msec()
		var number = rng.randi_range(0,100)
		if number > 0 and number < 25:
			$Water.visible = true
		if number > 25 and number < 60:
			$RedSoloCup.visible = true
		run = false
	


func _on_Wall_body_entered(body):
	if body is Player:
		if body.has_method("die"):
			body.die()


func _on_ScoreArea_body_exited(body):
	if body is Player:
		emit_signal("score")
