extends Control

func _ready():
	$VBoxContainer/Play.grab_focus()

func _on_play_pressed():
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit()
