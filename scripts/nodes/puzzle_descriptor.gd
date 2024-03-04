extends Object

const icon_btn_scene = preload("res://scenes/icon_btn.tscn")

class PuzzleDescriptor:
	var instruction: String
	var target: String
	
	func create_node(col: CollectibleModel.Collectible, parent):
		pass
	
	func set_messages(col: CollectibleModel.Collectible):
		pass
	
	func is_answer(col: CollectibleModel.Collectible):
		pass
		
class ImagePuzzle extends PuzzleDescriptor:
	
	func create_node(col: CollectibleModel.Collectible, parent):
		var btn = icon_btn_scene.instantiate()
		parent.add_child(btn)
		btn.set_texture(col.get_texture())
		return btn
	
	func is_answer(col):
		instruction = "Selecciona la traducción correcta de la siguiente palabra o frase:"
		target = col.translated_name
	
	
	
	
		
	



