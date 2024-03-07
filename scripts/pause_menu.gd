extends CanvasLayer

@onready var resume_btn = $Panel/HBoxContainer/VBoxContainer/ContinueBtn

signal resumed

func _ready():
	hide()
	resume_btn.pressed.connect(resume_game)
	pass


func pause_game():
	#target.add_child(self)
	get_tree().paused = true
	show()

func resume_game():
	#target.remove_child(self)
	get_tree().paused = false
	hide()

func _input(event):
	if event is InputEvent and event.is_action_pressed("pause"):
		if get_tree().paused:
			resume_game()
		else:
			pause_game()


func _on_main_menu_btn_pressed():
	resume_game()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
