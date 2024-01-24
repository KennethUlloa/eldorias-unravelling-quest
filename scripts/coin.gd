extends Area2D


@export var value = 100

func _on_body_entered(body):
	if body is Player:
		body.add_coin(value)
		queue_free()


