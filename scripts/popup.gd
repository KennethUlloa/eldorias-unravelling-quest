extends PanelContainer

class_name CustomPopUp

@onready var close_btn = $VBoxContainer/CloseButton
@onready var message_label = $VBoxContainer/MessageLabel


# Called when the node enters the scene tree for the first time.
signal closed

func _ready():
	#hide()
	pass
	
func set_message(msg):
	message_label.text = msg

func get_message():
	return message_label.text
	

func _on_button_pressed():
	closed.emit()
