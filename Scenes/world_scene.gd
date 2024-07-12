extends Sprite2D

var score = [0, 0]
# Called when the node enters the scene tree for the first time.
func _ready():
	$BackgroundMusic.play()







func _on_goal_post_right_body_entered(body):
	$Score.play()
	$Ball._ready()
	score[0] += 1
	$Hud/PlayerScore.text = str(score[0])
	$Ball.ball_speed = 200
	$Player.new_player_position()
	

func _on_goal_post_left_body_entered(body):
	$Score.play()
	$Ball._ready()
	score[1] += 1
	$Hud/CPUScore.text = str(score[1])
	$Ball.ball_speed = 200
	$Computer.new_player_position()
