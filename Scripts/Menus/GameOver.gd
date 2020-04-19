extends Control

onready var player_vars = get_node("/root/PlayerVariables")

func _ready():
	$MarginContainer/VBoxContainer2/MarginContainer/Label.text += player_vars.time_played

func _on_Restart_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")


func _on_Menu_pressed():
	get_tree().change_scene("res://Scenes/Menus/StartScreen.tscn")


func _on_Quit_pressed():
	get_tree().quit()
