extends Position2D

var car = preload("res://Scenes/Traps/Car.tscn")

func _on_Timer_timeout():
	add_child(car.instance())
	$Timer.start()
