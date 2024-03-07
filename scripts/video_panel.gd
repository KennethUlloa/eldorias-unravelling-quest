extends Control

@export var next_scene: PackedScene
@onready var video = $VideoStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	AudioPlayer.pause_bg()
	

func end_video_player():
	video.stop()
	AudioPlayer.resume_bg()
	get_tree().change_scene_to_packed(next_scene)

func _input(event):
	if event is InputEventKey and event.is_action_pressed("skip_video"):
		end_video_player()

func _on_video_stream_player_finished():
	end_video_player()
