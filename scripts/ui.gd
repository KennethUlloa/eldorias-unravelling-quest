extends Control


@onready var lifes_label = $Lifes/Value
	

func set_lifes(coins):
	lifes_label.text = str(coins)
