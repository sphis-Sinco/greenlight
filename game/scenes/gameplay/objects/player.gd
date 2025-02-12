extends CharacterBody2D

const SPEED = 600.0

@onready var sprite = $AnimatedSprite2D

func _physics_process(_delta):
	var h_dir = Input.get_axis("move_left", "move_right")
	var y_dir = Input.get_axis("move_up", "move_down")
	var used_speed = SPEED
	
	if h_dir or y_dir:
		
		if h_dir and y_dir:
			used_speed = SPEED/1.5
		
		velocity.x = h_dir * used_speed
		velocity.y = y_dir * used_speed
	else:
		velocity.x = move_toward(velocity.x, 0, used_speed)
		velocity.y = move_toward(velocity.y, 0, used_speed)
	
	if Input.is_action_just_pressed("move_left"):
		sprite.flip_h = true
	elif Input.is_action_just_pressed("move_right"):
		sprite.flip_h = false

	move_and_slide()
