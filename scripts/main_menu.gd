extends Control

@export var next_scene: PackedScene
@onready var textline = $Panel/LineEdit

func _ready():
	AudioPlayer.play_bg(AudioPlayer.Background.MAIN)


func _on_button_pressed():
	if textline.text != "":
		CurrentSession.player_name = textline.text
		get_tree().change_scene_to_packed(next_scene)
	else:
		MessageLayer.show_message("Ingresa un nombre para continuar")
	
