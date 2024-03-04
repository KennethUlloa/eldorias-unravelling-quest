extends Control

@onready var target = $MainPanel/TargetWord
@onready var instruction = $MainPanel/Instruction
@onready var grid = $MainPanel/GridContainer
@onready var attempts_label = $HBoxContainer/Attempts
@export var attempts = 3
@export var puzzle_style = 1

const TRANSLATION = 0
const IMAGE_SELECTION = 1

var icon_btn_scene = preload("res://scenes/icon_btn.tscn")

var puzzle: CollectibleModel.Puzzle

signal success
signal failed

func _ready():
	attempts_label.text = str(attempts)

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
		if attempts <= 0:
			failed.emit()
			return
			
		attempts_label.text = str(attempts)
		
		var message = puzzle.get_fail_message(ans_)
		MessageLayer.show_message(message)
		
		
		
		
		
