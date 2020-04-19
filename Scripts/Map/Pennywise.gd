extends Area2D

func _ready():
	$AnimationPlayer.play("eyes")

func _on_Pennywise_area_entered(area):
	$Sound.play()
	$Blood2.emitting = true
