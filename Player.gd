extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready
var animation = $AnimatedSprite2D

func _ready():
	animation.play("default")

func _physics_process(delta):
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var directionx = Input.get_axis("ui_left", "ui_right")
	if directionx:
		velocity.x = directionx * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var directiony = Input.get_axis("ui_up", "ui_down")
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	# Calculate the angle of the movement vector
	if velocity.length() > 0: # Only update the rotation if there's movement
		rotation = velocity.angle()
		if rotation >= PI/2 and rotation <= 3 * PI / 2:
			animation.scale.y = -1
			print(rotation)
		else:
			animation.scale.y = 1
			

		# Adjust the angle to only allow horizontal rotation

	move_and_slide()
