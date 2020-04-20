extends KinematicBody2D

var speed = 3
var direction = 1
var return_possible = true

signal pennywise
signal child
signal hit

# warning-ignore:unused_argument
func _process(delta):
	var lr = ""
	if Input.is_action_just_pressed("ui_accept") and return_possible:
		direction = -direction
		return_possible = false
		
	var displacement = Vector2(3, -1.5)
	displacement *= direction
	
	if Input.is_action_pressed("ui_left"):
		displacement.y -= Input.get_action_strength("ui_left")*2
		lr = "left"
	elif Input.is_action_pressed("ui_right"):
		displacement.y += Input.get_action_strength("ui_right")*2
		lr = "right"
	
	displacement = displacement.normalized()*300
	
	if Input.is_action_pressed("speed_down"):
		displacement.x -= Input.get_action_strength("speed_down")*100
		displacement.y += Input.get_action_strength("speed_down")*50
	
	if Input.is_action_pressed("speed_up"):
		displacement.x += Input.get_action_strength("speed_up")*100
		displacement.y -= Input.get_action_strength("speed_up")*50
	
	if direction == 1 :
		if lr == "left" :
			$AnimatedSprite.animation = "forward_left"
		elif lr == "right" :
			$AnimatedSprite.animation = "forward_right"
		else:
			$AnimatedSprite.animation = "forward"
	elif direction == -1 :
		if lr == "left" :
			$AnimatedSprite.animation = "backward_left"
		elif lr == "right" :
			$AnimatedSprite.animation = "backward_right"
		else:
			$AnimatedSprite.animation = "backward"

# warning-ignore:return_value_discarded
	move_and_slide(displacement)


# warning-ignore:unused_argument
func _on_TrapsDetector_area_entered(area):
	var start_color = Color(1.0, 1.0, 1.0, 1.0)
	var end_color = Color(1.0, 1.0, 1.0, 0.0)
	$Animation.start()
	$Tween.interpolate_property(self, "modulate", start_color, end_color, 0.5, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()
	emit_signal("hit")

# warning-ignore:unused_argument
func _on_ChildDetector_area_entered(area):
	emit_signal("child")

# warning-ignore:unused_argument
func _on_PennywiseDetector_area_entered(area):
	direction = 1
	emit_signal("pennywise")

# warning-ignore:unused_argument
func _on_PennywiseDetector_area_exited(area):
	return_possible = true

func _on_Animation_timeout():
	var end_color = Color(1.0, 1.0, 1.0, 1.0)
	var start_color = Color(1.0, 1.0, 1.0, 0.0)
	$Tween.interpolate_property(self, "modulate", start_color, end_color, 0.5, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()

func _on_GoBackDetector_area_entered(area):
	direction = -1
