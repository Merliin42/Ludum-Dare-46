extends KinematicBody2D

var speed = 3
var direction = 1
var return_possible = true
var childs = 0

signal pennywise

func _process(delta):
	var displacement = Vector2(3, -1.5)
	if Input.is_action_pressed("ui_left"):
		displacement.y -= 1.5
	elif Input.is_action_pressed("ui_right"):
		displacement.y += 1.5
	
	displacement = displacement.normalized()*300
	
	if Input.is_action_pressed("speed_down"):
		displacement.x -= Input.get_action_strength("speed_down")*100
		displacement.y += Input.get_action_strength("speed_down")*50
	
	if Input.is_action_just_pressed("ui_accept") and return_possible:
		direction = -direction
		return_possible = false
	
	displacement *= direction
	move_and_slide(displacement)


func _on_TrapsDetector_area_entered(area):
	print("hit!")
	childs = 0


func _on_ChildDetector_area_entered(area):
	print("Give me the child")
	childs += 1


func _on_PennywiseDetector_area_entered(area):
	print("You'll be the last one")
	direction = 1
	emit_signal("pennywise", childs)

func _on_PennywiseDetector_area_exited(area):
	return_possible = true
