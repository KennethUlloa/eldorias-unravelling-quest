extends Node2D

@onready var player = $Player
@onready var ui = $CanvasLayer/UI
@onready var start_position = $StartPoint
@onready var collectible_generator = $CollectibleGenerator
@onready var collectible_positions = $CollectiblePos
@onready var collectibles = $Collectibles
@onready var death_sound = $DeathSound
@onready var win_sound = $WinSound
@onready var background_sound = $BackgroundSong
@onready var menu = $CanvasLayer/Menu
var col = []

func _ready():
	player.connect("took_damage", ui.set_lifes)
	player.connect("dead", game_over)
	menu.retry_selected.connect(retry)
	menu.return_selected.connect(return_)
	#death_sound.finished.connect(restart_all)
	player.global_position = start_position.global_position
	$CanvasLayer/UI.set_lifes(player.lifes)
	
	for pos in collectible_positions.get_children():
		var collectible = collectible_generator.create_collectible()
		collectible.global_position = pos.global_position
		#collectible.collected.connect(player.add_coin)
		collectibles.add_child(collectible)


func _on_deathzone_body_entered(body):
	player.recieve_damage()
	if player.lifes >= 0:
		restart_player()
	


func restart_player():
	player.global_position = start_position.global_position

func game_over():
	$BackgroundSong.playing = false
	player.should_move = false
	menu.set_message("Perdiste...")
	menu.visible = true
	death_sound.play()


func retry():
	get_tree().reload_current_scene()

func return_():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
	
func win():
	player.should_move = false
	background_sound.playing = false
	menu.set_message("¡Ganaste!")
	menu.visible = true
	win_sound.play()


func _on_statue_body_entered(body):
	win()

