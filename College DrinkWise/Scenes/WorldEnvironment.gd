extends WorldEnvironment

var blur_amount = 0
var dof_blur_near_amount = 0.0

func _process(delta):
	print(Global.blur_strength)
	environment.dof_blur_near_amount = Global.blur_strength
