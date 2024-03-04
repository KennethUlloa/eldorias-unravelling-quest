extends CanvasLayer


@onready var popup = $PanelContainer/PopUp

func _ready():
	hide()
	popup.closed.connect(_close)

func show_message(text):
	popup.set_message(text)
	show()

func _close():
	popup.set_message("")
	hide()
	
