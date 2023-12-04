extends Node2D


func _on_TryAgain_pressed():
	get_tree().change_scene_to(load('res://Scenes/World.tscn'))

func _on_Quit_pressed():
	get_tree().quit()

func _on_MainMenu_pressed():
	get_tree().change_scene_to(load('res://Scenes/StartMenu.tscn'))

var strList = ["Always have a plan to get home", "Eat something before or while drinking",
 "Have a round of water", "Watch your drink", "Rule of thumb – one drink per hour", "Avoid drinking games",
 "Set limits and stick to them", "Never go anywhere alone", "Avoid Drinking Games"]

var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()
	displayRandomString()

func displayRandomString():
	var ix = rng.randi_range(0,strList.size()-1)    
	var randomStr = strList[ix]
	$Label.text = "Next Time:" + "\n" + "\n" + randomStr
