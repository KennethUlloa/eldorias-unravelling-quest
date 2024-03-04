extends Object

class_name CollectibleRepository

static var FRUITS = CollectibleModel.Vocabulary.new(
	"fruits",
	[
		CollectibleModel.Collectible.new(
			"apple",
			"apple",
			"manzana",
			"res://assets/vocabulary/img/Apple.png",
			"res://assets/vocabulary/sound/Apple.mp3"
		),
		CollectibleModel.Collectible.new(
			"banana",
			"banana",
			"banana",
			"res://assets/vocabulary/img/Banana.png",
			"res://assets/vocabulary/sound/Banana.mp3"
		),
		CollectibleModel.Collectible.new(
			"grapes",
			"grapes",
			"uvas",
			"res://assets/vocabulary/img/Grape.png",
			"res://assets/vocabulary/sound/Grapes.mp3"
		),
		CollectibleModel.Collectible.new(
			"orange",
			"orange",
			"naranja",
			"res://assets/vocabulary/img/Orange.png",
			"res://assets/vocabulary/sound/Orange.mp3"
		),
		CollectibleModel.Collectible.new(
			"strawberry",
			"strawberry",
			"fresa",
			"res://assets/vocabulary/img/strawberry.png",
			"res://assets/vocabulary/sound/Strawberry.mp3"
		)
	] as Array[CollectibleModel.Collectible]
)

static var ANIMALS = CollectibleModel.Vocabulary.new(
	"animals",
	[
		CollectibleModel.Collectible.new(
			"bear",
			"bear",
			"oso",
			"res://assets/vocabulary/img/Bear.png",
			"res://assets/vocabulary/sound/Bear.mp3"
		),
		CollectibleModel.Collectible.new(
			"lion",
			"lion",
			"león",
			"res://assets/vocabulary/img/Lion.png",
			"res://assets/vocabulary/sound/Lion.mp3"
		),
		CollectibleModel.Collectible.new(
			"monkey",
			"monkey",
			"mono",
			"res://assets/vocabulary/img/Monkey.png",
			"res://assets/vocabulary/sound/Monkey.mp3"
		),
		CollectibleModel.Collectible.new(
			"tigger",
			"tigger",
			"tigre",
			"res://assets/vocabulary/img/Tigger.png",
			"res://assets/vocabulary/sound/Tigger.mp3"
		),
		CollectibleModel.Collectible.new(
			"wolf",
			"wolf",
			"lobo",
			"res://assets/vocabulary/img/Wolf.png",
			"res://assets/vocabulary/sound/Wolf.mp3"
		)
	] as Array[CollectibleModel.Collectible]
)

static var PROFESSIONS = CollectibleModel.Vocabulary.new(
	"professions",
	[
		CollectibleModel.Collectible.new(
			"firefighter",
			"firefighter",
			"bomberos",
			"res://assets/vocabulary/img/Firefighter.png",
			"res://assets/vocabulary/sound/Firefighter.mp3"
		),
		CollectibleModel.Collectible.new(
			"musician",
			"musician",
			"músico",
			"res://assets/vocabulary/img/Musician.png",
			"res://assets/vocabulary/sound/Musician.mp3"
		),
		CollectibleModel.Collectible.new(
			"nurse",
			"nurse",
			"enfermera",
			"res://assets/vocabulary/img/Nurse.png",
			"res://assets/vocabulary/sound/Nurse.mp3"
		),
		CollectibleModel.Collectible.new(
			"policeman",
			"policeman",
			"policia",
			"res://assets/vocabulary/img/Policeman.png",
			"res://assets/vocabulary/sound/Policeman.mp3"
		),
		CollectibleModel.Collectible.new(
			"vet",
			"vet",
			"veterinario",
			"res://assets/vocabulary/img/Vet.png",
			"res://assets/vocabulary/sound/Vet.mp3"
		)
	] as Array[CollectibleModel.Collectible]
)

static var vocabulary_items = {
	"animals": ANIMALS,
	"fruits": FRUITS,
	"professions": PROFESSIONS
}




