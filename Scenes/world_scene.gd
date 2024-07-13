extends Sprite2D

var player_position : Vector2
var computer_position : Vector2
var ball_posiiton : Vector2
var new_player_speed : int
var new_computer_speed : int

var score = [0, 0]
# Called when the node enters the scene tree for the first time.
func _ready():
	$BackgroundMusic.play()
	
func _process(delta):
	$CountdownLabel.text = str(int($BallTimer.time_left) + 1)
	
	
	

	
func reset_speed():
	
	new_player_speed = 0
	$Player.speed = new_player_speed
	new_computer_speed = 0
	$Computer.speed = new_player_speed
	
		
	
	


func reset_position():
	player_position = Vector2(389, 0)
	$Player.position = player_position
	computer_position = Vector2(-389, 0)
	$Computer.position = computer_position




func _on_goal_post_right_body_entered(body):
	$Score.play()
	$Ball._ready()
	score[0] += 1
	$Hud/PlayerScore.text = str(score[0])
	$Ball.ball_speed = 200
	reset_position()
	$Ball.hide()
	$Ball.ball_movement = Vector2.ZERO
	$BallTimer.start()
	reset_speed()
	$CountdownLabel.visible = true
	$Countdown.play()

func _on_goal_post_left_body_entered(body):
	$Score.play()
	$Ball._ready()
	score[1] += 1
	$Hud/CPUScore.text = str(score[1])
	$Ball.ball_speed = 200
	reset_position()
	$Ball.hide()
	$Ball.ball_movement = Vector2.ZERO
	$BallTimer.start()
	reset_speed()
	$CountdownLabel.visible = true
	$Countdown.play()


func _on_ball_timer_timeout():
	$CountdownLabel.visible = false
	$Player.speed = 400
	$Computer.speed = 400
	$Ball.show()
	$Ball.ball_movement = $Ball.random_direction()

