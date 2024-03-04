extends PanelContainer


@onready var texture_rect = $TextureRect
var hover_theme = preload("res://scenes/icon_btn_hover.tres")
var normal_theme = preload("res://scenes/icon_btn.tres")

signal pressed

func _on_mouse_entered():
	add_theme_stylebox_override("panel", hover_theme)

func _on_mouse_exited():
	add_theme_stylebox_override("panel", normal_theme)

func set_texture(texture):
	texture_rect.texture = texture

func _on_texture_rect_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		pressed.emit()
