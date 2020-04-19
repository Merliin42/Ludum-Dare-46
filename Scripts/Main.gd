extends Node

var hungry = 60

func _ready():
	randomize()

func _on_Character_pennywise(childs):
	hungry += 10*childs

func _on_PennywiseHunger_timeout():
	hungry -= 1
	$GUI/MarginContainer/TextureProgress.value = hungry
	$PennywiseHunger.start()


