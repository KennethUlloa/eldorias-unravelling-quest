extends Control


# Called when the node enters the scene tree for the first time.

@onready var question_label = $Panel/VBoxContainer/Question
@onready var options_panel = $Panel/VBoxContainer/Buttons
var options = []
var answer = -1
var font


func _ready():
	load_question("Manzana", ["apple", "orange", "grapes"], 0)

func check_answer(index):
	print(index)
	if index == answer:
		print("OK")


func create_button(text, index):
	var btn = Button.new()
	btn.text = text
	btn.pressed.connect(check_answer.bind(index))

	return btn

func load_question(
	question: String,
	options_list: Array,
	_answer: int
):
	options = options_list
	clean_options()
	question_label.text = question
	answer = _answer
	for i in len(options_list):
		var option = options_list[i]
		var btn = create_button(option, i)
		options_panel.add_child(btn)
		

func clean_options():
	var children = options_panel.get_children()
	for i in len(children):
		options_panel.remove_child(children[i])
