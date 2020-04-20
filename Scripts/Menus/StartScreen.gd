extends Control

onready var music = get_node("/root/MenuMusic")
onready var player = get_node("/root/PlayerVariables")

func _ready():
	if player.is_playing == false :
		music.play()
		player.is_playing = true

func _on_Start_pressed():
	music.stop()
	get_tree().change_scene("res://Scenes/Main.tscn")


func _on_Instructions_pressed():
	get_tree().change_scene("res://Scenes/Menus/Instructions.tscn")


func _on_Intro_pressed():
	get_tree().change_scene("res://Scenes/Intro.tscn")
