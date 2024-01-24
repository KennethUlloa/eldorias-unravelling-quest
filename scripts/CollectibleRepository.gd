extends Object

class_name CollectibleRepository

const CollectibleResource = preload("res://scripts/CollectibleResource.gd")

static var list = {
	"apple": CollectibleResource.new(
		preload("res://assets/background/collectibles/Apple.png"),
		50,
		"apple"
	),
	"coin": CollectibleResource.new(
		preload("res://assets/background/collectibles/Coin_01.png"),
		50,
		"coin"
	),
	"diamond": CollectibleResource.new(
		preload("res://assets/background/collectibles/Diamond.png"),
		50,
		"diamond"
	),
	"key1": CollectibleResource.new(
		preload("res://assets/background/collectibles/Key_01.png"),
		50,
		"key1"
	),
	"key2": CollectibleResource.new(
		preload("res://assets/background/collectibles/Key_02.png"),
		50,
		"key2"
	)
}

static func get_as_list():
	return list.values()

static func get_by_name(_name): 
	return list[_name]
