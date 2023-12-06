extends Camera2D

var rng = RandomNumberGenerator.new()
var shake_amount = 0

#func shake(strength):
#	print("shake")
#	print(shake_amount)
#	shake_amount = strength

func _process(delta):
	print(Global.shake_strength)
	offset = Vector2(rand_range(-1.0, 1.0) * Global.shake_strength, rand_range(-1.0, 1.0) * Global.shake_strength)
