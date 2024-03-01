extends Node2D

@onready var player = $Player
@onready var start_position = $StartPosition
@onready var puzzle = $Canvas/Puzzle
@onready var ui = $Canvas/UI
@onready var message = $Canvas/MessagePanel
@onready var canvas = $Canvas
@onready var pause_menu = $PauseMenu

@export var collectible_list: Array[String]
@export var bg_sound: String = "level"

signal paused

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
	ui.pause_btn.pressed.connect(pause)
	pause_menu.resume_btn.pressed.connect(resume)
	paused.connect(pause_menu.toggle_view)
	message.retry_selected.connect(restart_level)

func pause():
	get_tree().paused = true
	paused.emit(true)

func resume():
	get_tree().paused = false
	paused.emit(false)
	

func set_player():
	ui.set_lifes(player.lifes)
	player.global_position = start_position.global_position
	player.took_damage.connect(ui.set_lifes)
	player.dead.connect(game_over)
	
func set_collectibles():
	set_puzzle()
	for cp in get_tree().get_nodes_in_group("collectible_position"):
		var option = puzzle.puzzle.options.pick_random()
		var node = CollectibleNodeGenerator.create_collectible(option)
		node.global_position = cp.global_position
		add_child(node)
		

func set_puzzle():
	var collectibles = CollectibleRepository.get_by_names(collectible_list)
	var answer = collectibles.pick_random()
	var puzzle_ = CollectibleModel.Puzzle.new(
		collectibles,
		answer.ID
	)
	puzzle.load_puzzle(puzzle_)
	puzzle.success.connect(win)
	puzzle.failed.connect(game_over)

# Conecta la colisión con el deathzone
func _on_deathzone_enter(body):
	if body is Player:
		body.recieve_damage()
		if body.lifes >= 0:
			restart_player()

func game_over():
	AudioPlayer.pause_bg()
	AudioPlayer.play_sfx("lose")
	message.set_message("Perdiste :c")
	message.visible = true

func win():
	AudioPlayer.pause_bg()
	AudioPlayer.play_sfx("win")
	message.set_message(puzzle.puzzle.get_success_message())
	message.visible = true
	puzzle.visible = false

# Conecta la colisión con la estatua
func _on_finish_level(body):
	if body is Player:
		body.should_move = false
		puzzle.visible = true


func restart_level():
	get_tree().reload_current_scene()
