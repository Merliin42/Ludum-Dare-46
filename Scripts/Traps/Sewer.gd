extends Area2D

# warning-ignore:unused_argument
func _on_Sewer_body_entered(body):
	$Sound.play()
