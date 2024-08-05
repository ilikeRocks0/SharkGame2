extends Area2D

@onready
var animation = $AnimatedSprite2D

@export
var speed = 100  # Adjust the speed as needed

var turn_speed = 5.0  # Adjust the turn speed as needed
var max_turn_angle = 30.0  # Maximum turning angle in degrees

var GameManager
# Called when the node enters the scene tree for the first time.

func init(gm):
	GameManager = gm

func _ready():
	animation.play("default")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_pos = GameManager.get_player_pos()
	var direction_to_player = (player_pos - position).normalized()
	
	var angle_to_player = direction_to_player.angle()
	var current_angle = rotation
	
	var angle_difference = wrapf(angle_to_player - current_angle, -PI, PI)
	
	# Limit the angle difference to within max_turn_angle
	var max_turn_angle_rad = deg_to_rad(max_turn_angle)
	angle_difference = clamp(angle_difference, -max_turn_angle_rad, max_turn_angle_rad)
	
	# Update the shark's rotation
	rotation += angle_difference * turn_speed * delta
	
	# Move the shark in the direction it is facing
	var movement_direction = Vector2(cos(rotation), sin(rotation))
	var velocity = movement_direction * speed * delta
	position += velocity
	
	# Flip the animation scale based on the direction of movement
	if rotation < PI/2 and rotation >= -PI / 2:
		animation.scale.y = 1
	else:
		animation.scale.y = -1

# Wrap angle to be within -PI to PI
func wrapf(value, min, max):
	var range = max - min
	return value - (range * floor((value - min) / range))
