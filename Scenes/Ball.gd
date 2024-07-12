extends CharacterBody2D

var ball_speed = 200
var ball_accel = 50
var speed : int
var ball_movement : Vector2

func _ready():
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
		if collider == $"../Player" or collider == $"../Computer":
			$"../PaddleHit".play()
			ball_speed += ball_accel
			ball_movement = ball_movement.bounce(collision.get_normal())
		else:
			ball_movement = ball_movement.bounce(collision.get_normal())
	
