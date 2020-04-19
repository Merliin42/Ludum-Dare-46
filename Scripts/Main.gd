extends Node

var hungry = 60
var childs = 0
onready var player_vars = get_node("/root/PlayerVariables")
var time_played = 0

func _ready():
	randomize()

func game_over():
	var minutes = int(time_played / 60)
	var seconds = time_played % 60
	player_vars.time_played = str(minutes) + "m" + str(seconds) + "s"
	

func _on_Character_pennywise():
	hungry += 10*childs
	childs = 0
	$GUI/ChildCounter/Label.text = str(childs)

func _on_PennywiseHunger_timeout():
	if hungry > 0 :
		hungry -= 1
		time_played += 1
		$GUI/HungryBar/TextureProgress.value = hungry
		$PennywiseHunger.start()
	else :
		game_over()

func _on_Character_child():
	childs += 1
	$GUI/ChildCounter/Label.text = str(childs)


func _on_Character_hit():
	childs = 0
	$GUI/ChildCounter/Label.text = str(childs)
