extends Node

var shake_strength = 0.0
var blur_strength = 0.0

signal red_solo_cup_collected
signal water_connected


func increase_effects():
	shake_strength += .5
	blur_strength += .03
	emit_signal("red_solo_cup_collected")

func decrease_effects():
	#shake_strength -= 1
	#blur_strength -= .04
	shake_strength = max(0.0, shake_strength - 0.3)
	blur_strength = max(0.0, blur_strength - 0.02)
	emit_signal("water_collected")
