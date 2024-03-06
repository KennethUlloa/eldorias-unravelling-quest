extends Button

@export var target_scene: PackedScene

func _on_pressed():
	if target_scene != null:
		get_tree().change_scene_to_packed(target_scene)
