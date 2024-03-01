extends Control


@onready var lifes_label = $Lifes/Value
@onready var pause_btn = $PauseBtn

func set_lifes(coins):
	lifes_label.text = str(coins)
