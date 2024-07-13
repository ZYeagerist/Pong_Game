extends CharacterBody2D

var ball_speed = 500
var ball_accel = 50
var speed : int
var ball_movement : Vector2
var MAX_Y_VECTOR : float = 0.6


func _ready():
	var sprite = $"../Player/Sprite2D"
	var p_height = sprite.texture.get_height()
	print(p_height)
	new_ball()
	

func new_ball():
	position.x = 0
	position.y = randi_range(200, -200)
	speed = ball_speed
	ball_movement = random_direction()
	
		
func random_direction():
	var new_movement := Vector2()
	new_movement.x = [1, -1].pick_random()
	new_movement.y = randf_range(-1, 1)
	return new_movement.normalized()
	
func _physics_process(delta):
	var collision = move_and_collide(ball_movement * ball_speed * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		if collider == $"../Player" or collider == $"../Computer" or collider == $"../Boundary":
			$"../PaddleHit".play()
			ball_speed += ball_accel
			ball_movement = ball_movement.bounce(collision.get_normal())
		else:
			ball_movement = ball_movement.bounce(collision.get_normal())
	if collider == $"../Computer":
		$"../Computer".speed -= 10
		print($"../Computer".speed)
			

