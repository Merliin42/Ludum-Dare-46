extends Area2D


func _process(delta):
	position.x += 150*delta
	position.y += 75*delta


func _on_Timer_timeout():
	queue_free()
