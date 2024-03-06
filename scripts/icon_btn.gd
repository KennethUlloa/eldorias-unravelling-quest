extends PanelContainer


@onready var texture_rect = $TextureRect
@export var texture: Texture2D = null
var hover_theme = preload("res://themes/button_selected.tres")
var normal_theme = preload("res://themes/button_texture.tres")

signal pressed

func _ready():
	if texture != null:
		texture_rect.texture = texture

func _on_mouse_entered():
	add_theme_stylebox_override("panel", hover_theme)

func _on_mouse_exited():
	add_theme_stylebox_override("panel", normal_theme)

func set_texture(texture):
	texture_rect.texture = texture

func _on_texture_rect_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		pressed.emit()
