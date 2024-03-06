extends Node

class_name CollectibleNodeGenerator

static var collectible_scene = preload("res://scenes/collectible.tscn")

static func create_collectible(collectible: CollectibleModel.Collectible):
	var coll_instance = collectible_scene.instantiate()
	coll_instance.load_values(collectible)
	return coll_instance
