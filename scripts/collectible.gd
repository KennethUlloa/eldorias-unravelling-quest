extends Area2D

var area = 86 * 86
var type: String
@onready var collision = $CollisionShape2D
var audio_stream: AudioStream

func _ready():
	pass # Replace with function body.
	
func load_values(texture: Texture2D, _a_stream: AudioStream, _type: String):
	type = _type
	$TextureRect.texture = texture
	audio_stream = _a_stream
	

func _on_body_entered(body):
	if body is Player:
		collision.set_deferred("disable", true)
		visible = false
		body.collect_item(type)
		if audio_stream == null:
			AudioPlayer.play_sfx(AudioPlayer.PICK_SFX)
		else:
			AudioPlayer.play_stream(audio_stream)
			
		queue_free()
		#audio.play()


func _on_audio_stream_player_2d_finished():
	queue_free()
