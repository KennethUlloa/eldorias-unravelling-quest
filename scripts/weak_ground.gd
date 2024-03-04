extends StaticBody2D

@onready var destroy_timer = $DestroyTimer
@onready var reload_timer = $ReloadTimer
@onready var destroy_sound = $DestroySound
@export var break_time = 5
@export var recover_time = 5
var should_break = true

func _ready():
	destroy_timer.wait_time = break_time
	reload_timer.wait_time = recover_time

func _on_area_2d_body_entered(body):
	destroy_sound.play()
	destroy_timer.start()


func _on_destroy_timer_timeout():
	set_active(false)
	reload_timer.start()

func _on_reload_timer_timeout():
	set_active(true)

func set_active(is_active):
	visible = is_active
	$Area/CollisionShape2D.disabled = not is_active
	$Shape.disabled = not is_active
