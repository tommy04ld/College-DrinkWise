extends Node2D


func _on_Quit_pressed():
	get_tree().quit()


func _on_NewGame_pressed():
	$AnimationPlayer.play("fade_to_black")



func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		get_tree().change_scene_to(load('res://Scenes/World.tscn'))
