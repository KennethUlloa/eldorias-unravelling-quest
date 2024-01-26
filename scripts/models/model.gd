extends Object
class_name CollectibleModel

class Collectible:
	var ID: String
	var name: String
	var translated_name: String
	var texture: String
	var sound: String
	
	func _init(id, _name, _translated_name, _texture, _sound = ""):
		ID = id
		name = _name
		translated_name = _translated_name
		texture = _texture
		sound = _sound
		
	func get_texture():
		return load(texture)
	
	func get_sound():
		return load(sound)
	

class Puzzle:
	var answer: String
	var options: Array[Collectible]
	var success_message: String = "¡Correcto! {name} es {translate}"
	var failure_message: String = "Casi, pero {name} es {translate}"
	
	func _init(options_, answer_):
		options = options_
		answer = answer_
		
	func check_answer(ans):
		return ans == answer
	
	func get_success_message():
		var coll = null
		for c in options:
			if c.ID == answer:
				coll = c
				break
		if coll != null:
			return success_message.format(
					{"name": coll.name, "translate": coll.translated_name})
		else:
			return ""
	
	func get_fail_message(op):
		var coll = null
		for c in options:
			if c.ID == op:
				coll = c
				break
		if coll != null:
			return failure_message.format(
					{"name": coll.name, "translate": coll.translated_name})
		else:
			return ""

			
