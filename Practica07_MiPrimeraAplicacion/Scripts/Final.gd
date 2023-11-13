extends Area2D


func _on_body_entered(body):
	if Global.monedas == 5:
		get_tree().change_scene_to_file("res://Scenes/mundo2.tscn")
