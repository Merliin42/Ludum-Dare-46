extends KinematicBody2D

var speed = 0

func _process(delta):
	if speed < 50 :
		speed += Input.get_action_strength("speed_up")
	speed *= 0.95
	move_and_slide(Vector2(speed*100, -speed*100))
