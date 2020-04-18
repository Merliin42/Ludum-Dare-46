extends Sprite

var direction = Vector2(-100, 50)

func _process(delta):
	position.x += direction.x*delta
	position.y += direction.y*delta

func _on_Area2D_area_entered(area):
	queue_free()
