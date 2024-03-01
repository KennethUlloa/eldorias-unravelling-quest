extends Area2D

var area = 86 * 86
var type: String
@onready var audio = $AudioStreamPlayer2D
@onready var collision = $CollisionShape2D

func _ready():
	pass # Replace with function body.
	
func load_values(texture: Texture2D, _type: String):
	type = _type
	$TextureRect.texture = texture
	

func _on_body_entered(body):
	if body is Player:
		collision.set_deferred("disable", true)
		visible = false
		body.collect_item(type)
		AudioPlayer.play_sfx("pick")
		queue_free()
		#audio.play()


func _on_audio_stream_player_2d_finished():
	queue_free()
