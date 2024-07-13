extends CharacterBody2D

@export var speed = 400
var ball


func _ready():
	ball = $"../Ball"
	
func handle_two_player_input(delta):
	var input = Vector2()
	 
	if Input.is_action_pressed("w"):
		input.y -= 1
	if Input.is_action_pressed("s"):
		input.y += 1

	velocity = input * speed
	input.normalized()
	input = move_and_slide()
	
	
func handle_one_player_input(delta):
	var input = Vector2(0, get_direction())
	velocity = input * speed
	input = move_and_slide()

func get_direction():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y: return 1
		else: return -1
	else: return 0	
	

func _physics_process(delta):
	if GameSettings.current_mode == GameSettings.GameMode.TWO_PLAYER:
		handle_two_player_input(delta)
	else:
		handle_one_player_input(delta)
	


	

