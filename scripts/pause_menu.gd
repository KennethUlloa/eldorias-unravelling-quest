extends CanvasLayer

@onready var resume_btn = $Panel/VBoxContainer/ContinueBtn
@onready var panel = $Panel

signal resumed

func _ready():
	hide()
	pass


func pause_game():
	#target.add_child(self)
	resume_btn.pressed.connect(resume_game)
	get_tree().paused = true
	show()


func resume_game():
	#target.remove_child(self)
	get_tree().paused = false
	hide()
	
func toggle_view(is_paused):
	if is_paused:
		show()
	else:
		hide()
