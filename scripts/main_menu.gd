extends Control

@export var next_scene: PackedScene
@onready var textline = $Panel/LineEdit
var popup_scene = load("res://scenes/popup.tscn")
func _ready():
	AudioPlayer.play_bg(AudioPlayer.MAIN_BG)


func _on_button_pressed():
	if textline.text != "":
		CurrentSession.player_name = textline.text
		get_tree().change_scene_to_packed(next_scene)
	else:
		MessageLayer.show_message("Ingresa un nombre para continuar")
	
