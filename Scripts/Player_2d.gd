extends CharacterBody2D

@export var speed = 400
var p_height : float




	
	

func _physics_process(delta):
	var input = Vector2()
	 
	if Input.is_action_pressed("up"):
		input.y -= 1
	if Input.is_action_pressed("down"):
		input.y += 1
		
		
		
		
	velocity = input * speed
	input.normalized()
	input = move_and_slide()
