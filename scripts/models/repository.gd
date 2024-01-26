extends Object

class_name CollectibleRepository

static var values = {
	"apple": CollectibleModel.Collectible.new(
		"apple",
		"apple",
		"manzana",
		"res://assets/background/collectibles/Apple.png"
	),
	"coin": CollectibleModel.Collectible.new(
		"coin",
		"coin",
		"moneda",
		"res://assets/background/collectibles/Coin_01.png"
	),
	"diamond": CollectibleModel.Collectible.new(
		"diamond",
		"diamond",
		"diamante",
		"res://assets/background/collectibles/Diamond.png"
	),
	"key": CollectibleModel.Collectible.new(
		"key",
		"key",
		"llave",
		"res://assets/background/collectibles/Key_01.png",
	),
	"star": CollectibleModel.Collectible.new(
		"star",
		"star",
		"estrella",
		"res://assets/background/collectibles/Star.png"
	)
}

static func get_by_names(names):
	var collectibles: Array[CollectibleModel.Collectible] = []
	for _name in names:
		if _name in values:
			collectibles.append(values[_name])
	return collectibles



