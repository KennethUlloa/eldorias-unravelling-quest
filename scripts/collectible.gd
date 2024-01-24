extends Area2D

var points = 0
var area = 86 * 86
var type: String
@onready var audio = $AudioStreamPlayer2D
var active = true

func _ready():
	pass # Replace with function body.
	
func load_values(_points, texture: Texture2D, _type: String):
	type = _type
	points = _points
	$TextureRect.texture = texture
	

func _on_body_entered(body):
	if body is Player and active:
		active = false
		body.collect_item(type)
		visible = false
		audio.play()


func _on_audio_stream_player_2d_finished():
	queue_free()
