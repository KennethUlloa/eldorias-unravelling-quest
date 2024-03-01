extends PanelContainer

@onready var close_btn = $VBoxContainer/Button
@onready var message_label = $VBoxContainer/Message
@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
signal closed

func _ready():
	hide()
	pass

var message: String:
	get:
		return message
	set(value):
		message = value
		message_label.text = message
		
func show_(time):
	show()
	timer.wait_time = time
	timer.start()
	await closed
	hide()

func _on_button_pressed():
	closed.emit()


func _on_timer_timeout():
	closed.emit()
