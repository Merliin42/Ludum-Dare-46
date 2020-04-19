extends Area2D

func _on_Pennywise_body_entered(body):
	$Sound.play()
