extends Node

var selected_puzzle: BasePuzzleControl
@onready var translation_control = $Translation
@onready var image_choice_control = $ImageChoice
@onready var sound_choice_control = $SoundChoice
@onready var clue_button = $ClueButton
@onready var try_button = $TryButton
enum PuzzleType {TRANSLATE = 0, IMAGE_CHOICE = 1, SOUND = 2}
@export var puzzle_type: PuzzleType = PuzzleType.TRANSLATE
enum Help {CLUE = 0, TRY = 1}
var puzzle
var points = 0

func _ready():
	set_up_selected_puzzle(puzzle_type)
	
	clue_button.pressed.connect(use_points.bind(100, Help.CLUE))
	try_button.pressed.connect(use_points.bind(50, Help.TRY))

func set_up_selected_puzzle(selected):
	if selected_puzzle != null:
		selected_puzzle.visible = false
		
	puzzle_type = selected
	if puzzle_type == PuzzleType.TRANSLATE:
		selected_puzzle = translation_control
	elif puzzle_type == PuzzleType.IMAGE_CHOICE:
		selected_puzzle = image_choice_control
	elif puzzle_type == PuzzleType.SOUND:
		selected_puzzle = sound_choice_control

	selected_puzzle.visible = true
	

func randomize_puzzle():
	var choice = PuzzleType.values().pick_random()
	set_up_selected_puzzle(choice)
	

func set_puzzle(puzzle_):
	puzzle = puzzle_
	selected_puzzle.load_puzzle(puzzle)

func set_available_points(points_):
	points = points_
	if points >= 50:
		try_button.visible = true
	
	if points >= 100:
		clue_button.visible = true

func use_points(value, type):
	points -= value
	
	if type == Help.TRY:
		selected_puzzle.attempts += 1
		selected_puzzle.update_label()
	elif type == Help.CLUE:
		selected_puzzle.reduce_options(3)
		
	if points < 50:
		try_button.visible = false
	
	if points < 100:
		clue_button.visible = false
		

		

	
		

