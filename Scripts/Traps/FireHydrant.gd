extends Area2D


func _on_FireHydrant_area_entered(area):
	$Sound.play()
