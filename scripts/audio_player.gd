extends Node

class_name CustomAudioHandler

enum Background {MAIN = 0, LEVEL = 1}
enum SFX {WIN = 0, LOSE = 1, PICK = 2}

@onready var background = $Background
var bg_sound = preload("res://assets/sound/game-setting-fantasy-142092.mp3")

var sfx_vals = {
	SFX.WIN: preload("res://assets/sound/violin-win-5-185128.mp3"),
	SFX.LOSE: preload("res://assets/sound/violin-lose-4-185125.mp3"),
	SFX.PICK: preload("res://assets/sound/collect-5930.mp3")
}

var bg_vals = {
	Background.MAIN: preload("res://assets/sound/get-in-here-fantasy-instrumental-164331.mp3"),
	Background.LEVEL: preload("res://assets/sound/game-setting-fantasy-142092.mp3")
}
# Called when the node enters the scene tree for the first time.
func _ready():
	background.stream = bg_sound
	background.play()

func play_sfx(sfx):
	if sfx in sfx_vals:
		var player = AudioStreamPlayer.new()
		player.bus = "SFX"
		player.stream = sfx_vals[sfx]
		add_child(player)
		player.play()
		await player.finished
		player.queue_free()

func play_stream(stream):

	if stream != null:
		var player = AudioStreamPlayer.new()
		player.bus = "SFX"
		player.stream = stream
		add_child(player)
		player.play()
		await player.finished
		player.queue_free()

func play_bg(bg):
	if bg in bg_vals.keys():
		background.playing = false
		background.stream = bg_vals[bg]
		background.play()

func pause_bg():
	background.playing = false

func is_playing():
	return background.playing

func resume_bg():
	background.playing = true
