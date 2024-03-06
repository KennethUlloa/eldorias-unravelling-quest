extends Area2D

@onready var collision = $CollisionShape2D
var audio_stream: AudioStream
@export var points = 0
	
func load_values(collectible: CollectibleModel.Collectible):
	$TextureRect.texture = collectible.get_texture()
	audio_stream = collectible.get_sound()
	
func _on_body_entered(body):
	if body is Player:
		#Disables the collision when the collision finish the current process
		collision.set_deferred("disable", true)
		visible = false
		body.collect_item(points)
		
		if audio_stream == null:
			AudioPlayer.play_sfx(AudioPlayer.SFX.PICK)
		else:
			AudioPlayer.play_stream(audio_stream)
			
		queue_free()

