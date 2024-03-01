extends Control

@export var next_scene: PackedScene

func _ready():
	AudioPlayer.play_bg("main")


func _on_button_pressed():
	get_tree().change_scene_to_packed(next_scene)
