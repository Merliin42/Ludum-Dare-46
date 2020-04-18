extends Node

var hungry = 60
var Child = preload("res://Scenes/Child.tscn")

func _ready():
	randomize()

func _on_Character_pennywise(childs):
	hungry += 10*childs

func _on_PennywiseHunger_timeout():
	hungry -= 1
	$GUI/MarginContainer/TextureProgress.value = hungry
	$PennywiseHunger.start()


func _on_ChildSpawn_timeout():
	$ChildPath/ChildSpawner.offset = randi()
	var child = Child.instance()
	add_child(child)
	child.position = $ChildPath/ChildSpawner.position
	child.direction.x += rand_range(10, -10)
	child.direction.y += rand_range(10, -10)
		
	$ChildSpawn.start()
