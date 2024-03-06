extends Node2D

@onready var player = $Player
@onready var start_position = $StartPosition
@onready var puzzle_control = $CanvasLayer/TranslationPuzzle
@onready var ui = $CanvasLayer/UI
@onready var message = $CanvasLayer/MessagePanel
@export var vocabulary_name: CollectibleRepository.Vocabulary
@export var bg_sound: CustomAudioHandler.Background = AudioPlayer.Background.LEVEL


# Called when the node enters the scene tree for the first time.
func _ready():
	AudioPlayer.play_bg(bg_sound)
	# Ubicar al jugador en la posición inicial
	set_player()
	# Conectar los eventos de las trampas
	set_traps()
	# Generar los elementos coleccionables
	set_collectibles()
	# Set ui
	set_ui()
	
func restart_player():
	player.global_position = start_position.global_position

func set_traps():
	pass

func set_ui():
	message.retry_selected.connect(restart_level)
	message.return_selected.connect(return_to_scene)


func set_player():
	ui.set_lifes(player.lifes)
	player.global_position = start_position.global_position
	player.took_damage.connect(ui.set_lifes)
	player.dead.connect(game_over)
	player.recolected.connect(ui.set_points)
	
func set_collectibles():
	set_puzzle()
	for cp in get_tree().get_nodes_in_group("collectible_position"):
		var option = puzzle_control.puzzle.options.pick_random()
		var node = CollectibleNodeGenerator.create_collectible(option)
		node.global_position = cp.global_position
		add_child(node)
		

func set_puzzle():
	var vocabulary = CollectibleRepository.vocabulary_items.get(vocabulary_name)
	var collectibles = vocabulary.collectibles
	var answer = collectibles.pick_random()
	var puzzle_ = CollectibleModel.Puzzle.new(
		collectibles,
		answer.ID
	)
	puzzle_control.randomize_puzzle()
	puzzle_control.set_puzzle(puzzle_)
	puzzle_control.selected_puzzle.success.connect(win)
	puzzle_control.selected_puzzle.failed.connect(game_over)

# Conecta la colisión con el deathzone
func _on_deathzone_enter(body):
	if body is Player:
		body.recieve_damage()
		if body.lifes >= 0:
			restart_player()

func game_over():
	AudioPlayer.pause_bg()
	AudioPlayer.play_sfx(AudioPlayer.SFX.LOSE)
	message.set_message("Perdiste :c")
	puzzle_control.visible = false
	message.visible = true

func win():
	AudioPlayer.pause_bg()
	AudioPlayer.play_sfx(AudioPlayer.SFX.WIN)
	message.set_message(puzzle_control.puzzle.get_success_message())
	message.visible = true
	puzzle_control.visible = false

# Conecta la colisión con la estatua
func _on_finish_level(body):
	if body is Player:
		body.should_move = false
		puzzle_control.visible = true
		puzzle_control.set_available_points(player.score)
		AudioPlayer.play_bg(AudioPlayer.Background.MAIN)

func restart_level():
	get_tree().reload_current_scene()

func return_to_scene():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
