extends Sprite

var direction = Vector2(-100, 50)

func _process(delta):
	position.x += direction.x*delta
	position.y += direction.y*delta

func dead():
	self.texture = null
	$Blood.emitting = true
	$Timer.start()

func _on_Timer_timeout():
	queue_free()


# warning-ignore:unused_argument
func _on_Death_area_entered(area):
	dead()


# warning-ignore:unused_argument
func _on_Collisions_body_entered(body):
	queue_free()
