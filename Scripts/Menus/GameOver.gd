extends Control

onready var music = get_node("/root/MenuMusic")
onready var player_vars = get_node("/root/PlayerVariables")

func _ready():
	$MarginContainer/VBoxContainer2/MarginContainer/HBoxContainer/Label2.text += player_vars.time_played
	music.play()
	player_vars.is_playing = true

func _on_Restart_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")


func _on_Menu_pressed():
	get_tree().change_scene("res://Scenes/Menus/StartScreen.tscn")


func _on_Quit_pressed():
	get_tree().quit()
