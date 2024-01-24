extends Node


@onready var collectibles = preload("res://scripts/CollectibleRepository.gd")
@onready var collectible_scene = preload("res://scenes/collectible.tscn")

func create_collectible():
	var coll = collectibles.get_as_list().pick_random()
	var coll_instance = collectible_scene.instantiate()
	coll_instance.load_values(coll.points, coll.texture, coll.type_name)
	return coll_instance
