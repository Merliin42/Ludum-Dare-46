extends Node

var hungry = 60
var childs = 0

func _ready():
	randomize()

func _on_Character_pennywise():
	hungry += 10*childs
	childs = 0
	$GUI/ChildCounter/Label.text = str(childs)

func _on_PennywiseHunger_timeout():
	hungry -= 1
	$GUI/HungryBar/TextureProgress.value = hungry
	$PennywiseHunger.start()

func _on_Character_child():
	childs += 1
	$GUI/ChildCounter/Label.text = str(childs)


func _on_Character_hit():
	childs = 0
	$GUI/ChildCounter/Label.text = str(childs)
