extends Control

@onready var greeting_label = $Label
# Called when the node enters the scene tree for the first time.
func _ready():
	if CurrentSession.player_name != "":
		var temp_str = "Hola " + CurrentSession.player_name + "\n" \
		+ greeting_label.text
		greeting_label.text = temp_str
		
	if !AudioPlayer.is_playing():
		AudioPlayer.play_bg(AudioPlayer.Background.MAIN)
	
	
