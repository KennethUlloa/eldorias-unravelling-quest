extends Control


@onready var lifes_label = $Lifes/Value
@onready var points_label = $Points/Value

func set_lifes(coins):
	lifes_label.text = str(coins)

func set_points(points):
	points_label.text = str(points)
