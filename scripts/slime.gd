extends Area2D

@export var force = 1000

func _on_body_entered(body):
	if body is Player:
		print("player jump")
		body.velocity.y = -force
