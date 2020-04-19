extends Path2D

onready var Child = preload("res://Scenes/Map/ChildSpawner/Child.tscn")

func _on_ChildSpawn_timeout():
	$Position.offset = randi()
	var child = Child.instance()
	add_child(child)
	child.position = $Position.position
	child.direction.x += rand_range(20, -20)
	child.direction.y += rand_range(20, -20)
		
	$ChildSpawn.start()
