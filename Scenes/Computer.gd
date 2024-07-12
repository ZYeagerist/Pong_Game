extends CharacterBody2D

@export var speed = 200


func _physics_process(delta):
	var input = Vector2()
	 
	if Input.is_action_pressed("w"):
		input.y -= 1
	if Input.is_action_pressed("s"):
		input.y += 1
		
		
		
	velocity = input * speed
	input.normalized()
	input = move_and_slide()

