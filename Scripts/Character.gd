extends KinematicBody2D

var speed = 3
var direction = 1
var return_possible = true
var childs = 0

signal pennywise

# warning-ignore:unused_argument
func _process(delta):
	
	if Input.is_action_just_pressed("ui_accept") and return_possible:
		direction = -direction
		return_possible = false
		
	var displacement = Vector2(3, -1.5)
	displacement *= direction
	
	if Input.is_action_pressed("ui_left"):
		displacement.y -= 1.5
	elif Input.is_action_pressed("ui_right"):
		displacement.y += 1.5
	
	displacement = displacement.normalized()*300
	
	if Input.is_action_pressed("speed_down"):
		displacement.x -= Input.get_action_strength("speed_down")*100
		displacement.y += Input.get_action_strength("speed_down")*50
	
	if direction == 1 :
		$AnimatedSprite.animation = "forward"
	elif direction == -1 :
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
	childs = 0


# warning-ignore:unused_argument
func _on_ChildDetector_area_entered(area):
	print("Give me the child")
	childs += 1


# warning-ignore:unused_argument
func _on_PennywiseDetector_area_entered(area):
	print("You'll be the last one")
	direction = 1
	emit_signal("pennywise", childs)

# warning-ignore:unused_argument
func _on_PennywiseDetector_area_exited(area):
	return_possible = true

func _on_Animation_timeout():
	var end_color = Color(1.0, 1.0, 1.0, 1.0)
	var start_color = Color(1.0, 1.0, 1.0, 0.0)
	$Tween.interpolate_property(self, "modulate", start_color, end_color, 0.5, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()
