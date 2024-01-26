extends CharacterBody2D

class_name Player
const SPEED = 250.0
const JUMP_VELOCITY = -400.0

var coins = 0
@export var lifes = 1
@onready var anim = $AnimatedSprite2D
@onready var hurt_sound = $HurtSound
@onready var run_sound = $Running
@onready var jump_sound = $Jumping


var should_move = true
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var inventory = {}


signal recolected
signal dead
signal took_damage

func _physics_process(delta):
	if not should_move:
		run_sound.playing = false
		return
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump_sound.playing = true
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		
		anim.flip_h = direction < 0
	else:
		run_sound.playing = false
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	process_animation()
	move_and_slide()


func process_animation():
		
	if is_on_floor():
		if velocity.x != 0:
			if not run_sound.playing:
				run_sound.play()
				
			anim.play("run")
		else:
			anim.play("idle")
	else:
		run_sound.playing = false
		anim.play("jump")


func collect_item(item: String):
	if item not in inventory:
		inventory[item] = 1
	else:
		inventory[item] += 1
	recolected.emit()

	
func recieve_damage():
	lifes -= 1
	if lifes < 0:
		dead.emit()
		return
	took_damage.emit(lifes)
	hurt_sound.play()

	
	
