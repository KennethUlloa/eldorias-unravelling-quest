extends "res://scripts/nodes/base_translation_puzze.gd"

@onready var word = $TargetWord

func _ready():
	attempts_label = $HBoxContainer/Attempts
	button_grid = $GridContainer
	attempts_label.text = str(attempts)
	
	
func load_answer(col):
	word.text = col.translated_name
	
func reduce_options(count):
	super(count)
	button_grid.columns = count




		


		
		
		
		
