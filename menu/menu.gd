extends Control

func _ready():
	$VBoxContainer/Play.grab_focus()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://lvl/lvl_01.tscn")

func _on_quit_pressed():
	get_tree().quit()
