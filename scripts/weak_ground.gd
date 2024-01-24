extends StaticBody2D

@onready var destroy_timer = $DestroyTimer
@onready var reload_timer = $ReloadTimer
@onready var destroy_sound = $DestroySound
var should_break = true

func _on_area_2d_body_entered(body):
	destroy_sound.play()
	destroy_timer.start()


func _on_destroy_timer_timeout():
	set_state(false)
	reload_timer.start()

func _on_reload_timer_timeout():
	set_state(true)

func set_state(is_active):
	visible = is_active
	$Area/CollisionShape2D.disabled = not is_active
	$Shape.disabled = not is_active
