extends Control

@onready var target = $MainPanel/TargetWord
@onready var grid = $MainPanel/GridContainer
@onready var message = $MessageContainer/Message
@onready var message_container = $MessageContainer
@onready var attempts_label = $HBoxContainer/Attempts
@export var attempts = 3

var puzzle: CollectibleModel.Puzzle

signal success
signal failed

func _ready():
	load_puzzle(CollectibleModel.Puzzle.new(
		CollectibleRepository.get_by_names(["apple","star","key"]),
		"apple"
	))
	attempts_label.text = str(attempts)
	message.closed.connect(message_container.hide)

func load_puzzle(_puzzle: CollectibleModel.Puzzle):
	puzzle = _puzzle
	clear_buttons()
	for p in puzzle.options:
		var btn = Button.new()
		btn.text = p.name
		btn.pressed.connect(check_answer.bind(p.ID))
		btn.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		grid.add_child(btn)
		if puzzle.check_answer(p.ID):
			target.text = p.translated_name
	

func clear_buttons():
	var grid_children = grid.get_children()
	for c in grid_children:
		grid.remove_child(c)
		

func check_answer(ans_):
	if puzzle.check_answer(ans_):
		success.emit()
	else:
		attempts -= 1
		attempts_label.text = str(attempts)
		message.message = puzzle.get_fail_message(ans_)
		message_container.show()
		await message.show_(5)
		
		if attempts <= 0:
			failed.emit()
