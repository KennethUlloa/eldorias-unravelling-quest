extends "res://scripts/nodes/base_translation_puzze.gd"

@onready var instruction = $Instruction
@onready var image = $TargetImage

func _ready():
	attempts_label = $HBoxContainer/Attempts
	button_grid = $GridContainer
	attempts_label.text = str(attempts)

func load_answer(col):
	image.texture = col.get_texture()




		
