extends Control

@onready var target = $MainPanel/TargetWord
@onready var grid = $MainPanel/GridContainer
@onready var message = $Message
var puzzle: CollectibleModel.Puzzle

signal success
signal failed

func _ready():
	load_puzzle(CollectibleModel.Puzzle.new(
		CollectibleRepository.get_by_names(["apple","star","key"]),
		"apple"
	))
	pass

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
	print(ans_)
	if puzzle.check_answer(ans_):
		success.emit()
	else:
		message.text = puzzle.get_fail_message(ans_)
		message.visible = true
		await get_tree().create_timer(5).timeout
		message.visible = false
		failed.emit()
