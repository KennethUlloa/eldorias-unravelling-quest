extends "res://scripts/nodes/base_translation_puzze.gd"

@onready var sound_button = $Button
var answer_sound: AudioStream

func _ready():
	attempts_label = $HBoxContainer/Attempts
	attempts_label.text = str(attempts)
	button_grid = $GridContainer
	sound_button.pressed.connect(play_sound)

func play_sound():
	print(play_sound)
	AudioPlayer.play_stream(answer_sound)

func load_answer(_col):
	print(_col.ID)
	answer_sound = _col.get_sound()

func get_message(collectible):
	AudioPlayer.play_stream(collectible.get_sound())
	return "Cerca..."

func _add_btn(collectible):
	var btn = super(collectible)
	btn.text = collectible.translated_name
	return btn




