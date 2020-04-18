extends KinematicBody2D

var speed = 3

func _process(delta):
	var displacment = Vector2(3, -1.5)
	if Input.is_action_pressed("ui_left"):
		displacment.y -= 1.5
	elif Input.is_action_pressed("ui_right"):
		displacment.y += 1.5
	
	displacment = displacment.normalized()*300
	
	if Input.is_action_pressed("speed_down"):
		displacment.x -= Input.get_action_strength("speed_down")*100
		displacment.y += Input.get_action_strength("speed_down")*50
	
	move_and_slide(displacment)


func _on_TrapsDetector_area_entered(area):
	print("hit!")


func _on_ChildDetector_area_entered(area):
	print("Give me the child")
