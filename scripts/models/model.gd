extends Object
class_name CollectibleModel

class Collectible:
	var ID: String
	var name: String
	var translated_name: String
	var texture: String
	var sound: String
	var _audio_stream: AudioStream = null
	var _texture: Texture2D = null
	
	func _init(id, _name, _translated_name, _texture, _sound = ""):
		ID = id
		name = _name
		translated_name = _translated_name
		texture = _texture
		sound = _sound
		
	func get_texture():
		if _texture == null:
			_texture = load(texture)
		return _texture
	
	func get_sound():
		if _audio_stream == null:
			_audio_stream = load(sound)
		return _audio_stream
	

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
	
	func get_collectible(id):
		for c in options:
			if c.ID == id:
				return c
		
		return null
			
class Vocabulary:
	var collectibles: Array[Collectible]
	var theme: String
	
	func _init(_theme, _collectibles):
		theme = _theme
		collectibles = _collectibles
	
	
	
