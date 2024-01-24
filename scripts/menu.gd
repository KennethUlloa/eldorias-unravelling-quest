extends Control

signal retry_selected
signal return_selected


func set_message(message):
	$Message.text = message
	
func on_retry():
	retry_selected.emit()


func on_return():
	return_selected.emit()
