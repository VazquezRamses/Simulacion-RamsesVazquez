extends Control

func _ready():
	$VBoxContainer/Start_Button.grab_focus()

func _on_start_button_pressed():
	Global.monedas = 0
	get_tree().change_scene_to_file("res://Scenes/mundo.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
