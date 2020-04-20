extends Node2D

var direction = Vector2(-100, 50)

func _process(delta):
	position.x += direction.x*delta
	position.y += direction.y*delta

func dead():
	$Sound.play()
	$AnimatedSprite.visible = false
	$Blood.emitting = true
	$Timer.start()

func fade_out():
	var start_color = Color(1.0, 1.0, 1.0, 1.0)
	var end_color = Color(1.0, 1.0, 1.0, 0.0)
	$Tween.interpolate_property(self, "modulate", start_color, end_color, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()


func _on_Timer_timeout():
	queue_free()

# warning-ignore:unused_argument
func _on_Death_area_entered(area):
	dead()

# warning-ignore:unused_argument
func _on_Collisions_body_entered(body):
	fade_out()


func _on_Death_body_entered(body):
	dead()


func _on_Tween_tween_completed(object, key):
	queue_free()
