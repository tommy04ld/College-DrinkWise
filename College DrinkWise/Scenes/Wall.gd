extends Area2D


var rng = RandomNumberGenerator.new()
var run = true

func _process(delta):
	if run:
		rng.seed = Time.get_ticks_msec()
		var number = rng.randi_range(1,5)
		if number == 1:
			$Sprite.play("Red")
		if number == 2:
			$Sprite.play("Blue")
		if number == 3:
			$Sprite.play("Green")
		if number == 4:
			$Sprite.play("Orange")
		run = false
