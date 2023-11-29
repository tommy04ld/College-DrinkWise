extends Node2D


func _on_TryAgain_pressed():
	get_tree().change_scene_to(load('res://Scenes/World.tscn'))


func _on_Quit_pressed():
	get_tree().quit()


func _on_MainMenu_pressed():
	get_tree().change_scene_to(load('res://Scenes/StartMenu.tscn'))
