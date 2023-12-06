extends CanvasLayer

onready var score_label = $Score
onready var red_score_label = $SoloCup
onready var water_score_label = $Water

func update_score(new_score):
	score_label.text = str(new_score)

func update_water_score(new_water_score):
	red_score_label.text = str(new_water_score)

func update_red_score(new_red_score):
	water_score_label.text = str(new_red_score)
