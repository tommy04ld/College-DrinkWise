extends Node2D

onready var hud = $HUD
onready var obstacle_spawner = $ObstacleSpawner
onready var road = $Road

var score = 0 setget set_score
var water_score = 0 setget set_water_score
var red_score = 0 setget set_red_score

func _ready():
	$AnimationPlayer.play("fade_to_normal")
	Global.connect("red_solo_cup_collected", self, "_on_red_solo_cup_collected")
	Global.connect("water_collected", self, "on_water_collected")

func _on_red_solo_cup_collected():
	#$Camera2D.shake(Global.shake_strength)
	$WorldEnvironment.set("dof_blur_near_amount", Global.blur_strength)

func _on_water_collected():
	$Camera2D.shake(Global.shake_strength)
	$WorldEnvironment.set("dof_blur_near_amount", Global.blur_strength)

func new_game():
	self.score = 0
	self.water_score = 0
	self.red_score = 0
	obstacle_spawner.start()

func player_score():
	self.score += 1

func player_water_score():
	self.water_score += 1

func player_red_score():
	self.red_score += 1

func set_score(new_score):
	score = new_score
	hud.update_score(score)

func set_water_score(new_water_score):
	water_score = new_water_score
	hud.update_water_score(water_score)

func set_red_score(new_red_score):
	red_score = new_red_score
	hud.update_red_score(red_score)

func _on_obstacle_created(obs):
	obs.connect("score", self, "player_score")
	obs.connect("red_score", self, "player_water_score")
	obs.connect("water_score", self, "player_red_score")


func _on_DeathZone_body_entered(body):
	if body is Player:
		if body.has_method("die"):
			body.die()


func _on_Player_died():
	game_over()

func game_over():
	obstacle_spawner.stop()
	road.get_node("AnimationPlayer").stop()
	get_tree().call_group("obstacles", "set_physics_process", false)
	$AnimationPlayer.play("fade_to_black")
	$HUD.hide()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_to_normal":
		Global.shake_strength = 0
		Global.blur_strength = 0
		obstacle_spawner.connect("obstacle_created", self, "_on_obstacle_created")
		new_game()
		$HUD.show()
	
	if anim_name == "fade_to_black":
		get_tree().change_scene_to(load('res://Scenes/LoseScreen.tscn'))


