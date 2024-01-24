extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func load_textures(textures):
	$Container/Panel1/Texture.texture = textures[0]
	$Container/Panel1/Texture.size = Vector2(32, 32)
	$Container/Panel2/Texture.texture = textures[1]
	$Container/Panel2/Texture.size = Vector2(32, 32)
	$Container/Panel3/Texture.texture = textures[2]
	$Container/Panel3/Texture.size = Vector2(32, 32)
