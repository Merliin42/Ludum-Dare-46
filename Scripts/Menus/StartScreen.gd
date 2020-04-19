extends Control

func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")


func _on_Instructions_pressed():
	get_tree().change_scene("res://Scenes/Menus/Instructions.tscn")
