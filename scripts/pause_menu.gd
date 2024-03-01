extends CanvasLayer

class_name PauseMenu

@onready var resume_btn = $Panel/VBoxContainer/ContinueBtn
@onready var panel = $Panel

func _ready():
	hide()
	
func toggle_view(is_paused):
	if is_paused:
		show()
	else:
		hide()
