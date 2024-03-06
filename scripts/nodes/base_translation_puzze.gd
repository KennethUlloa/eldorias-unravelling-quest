extends Control

class_name BasePuzzleControl

var puzzle: CollectibleModel.Puzzle
var button_grid: GridContainer
@export var attempts: int = 3
var attempts_label: Label

signal success
signal failed

func load_puzzle(_puzzle: CollectibleModel.Puzzle):
	puzzle = _puzzle
	load_btns(puzzle.options)

func reduce_options(count):
	var options = puzzle.reduced_options(count)
	load_btns(options)

func load_answer(collectible: CollectibleModel.Collectible):
	pass

func load_btns(options):
	print("load buttons")
	clear_buttons()
	for op in options:
		_add_btn(op)
		if puzzle.check_answer(op.ID):
			load_answer(op)


func _add_btn(collectible):
	var btn = Button.new()
	btn.text = collectible.name
	btn.pressed.connect(check_answer.bind(collectible, btn))
	btn.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	button_grid.add_child(btn)
	return btn

func clear_buttons():
	var grid_children = button_grid.get_children()
	for c in grid_children:
		button_grid.remove_child(c)

func update_label():
	attempts_label.text = str(attempts)

func check_answer(col, btn):
	if puzzle.check_answer(col.ID):
		success.emit()
	else:
		
		attempts -= 1
		if attempts <= 0:
			failed.emit()
			return
			
		attempts_label.text = str(attempts)
		
		var message = get_message(col)
		MessageLayer.show_message(message)

func get_message(collectible):
	return puzzle.get_fail_message(collectible.ID)
