extends CharacterBody2D


const SPEED = 300.0

func _physics_process(delta):
	# Move left to right
	var h_dir = Input.get_axis("move_left", "move_right")
	if h_dir:
		velocity.x = h_dir * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Move up and down
	var y_dir = Input.get_axis("move_up", "move_down")
	if y_dir:
		velocity.y = y_dir * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
