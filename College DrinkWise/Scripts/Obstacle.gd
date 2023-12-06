extends Node2D


signal water_score
signal red_score
signal water_colleceted
signal solo_collected

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
			$Water.monitoring = true
		if number > 25 and number < 65:
			$RedSoloCup.visible = true
			$RedSoloCup.monitoring = true
		run = false
	


func _on_Wall_body_entered(body):
	if body is Player:
		if body.has_method("die"):
			body.die()


func _on_ScoreArea_body_exited(body):
	if body is Player:
		emit_signal("score")
		#$point.play()


func _on_Water_body_entered(body):
	if body is Player:
		Global.decrease_effects()
		print("water")
		$waterGulp.play()
		emit_signal("water_score")
		#emit_signal("water_collected")
		$Water.queue_free()


func _on_RedSoloCup_body_entered(body):
	if body is Player:
		Global.increase_effects()
		print("solocup")
		$redGulp.play()
		emit_signal("red_score")
		#emit_signal("solo_collected")
		$RedSoloCup.queue_free()
