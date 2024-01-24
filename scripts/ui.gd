extends Control


@onready var lifes_label = $Lifes/Value
@onready var collectible_panel_scene = preload("res://scenes/collectible_panel.tscn")
@onready var collectible_repo = preload("res://scripts/CollectibleRepository.gd")
@onready var button = $Button
	

func set_lifes(coins):
	lifes_label.text = str(coins)
