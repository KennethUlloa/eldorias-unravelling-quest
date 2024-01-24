extends PanelContainer

func _ready():
	$PanelContainer/TextureRect.size = Vector2(64, 64)

func init_panel(name_, num, texture):
	$PanelContainer/TextureRect.texture = texture
	$PanelContainer/Label.text = "%sx%d" % [name_, num]
