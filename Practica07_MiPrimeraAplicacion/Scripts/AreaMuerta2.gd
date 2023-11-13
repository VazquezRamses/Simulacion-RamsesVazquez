extends Area2D


func _on_body_entered(body):
	if body is Player:
		print("reinicio")
		Global.monedas = 0	
		Global.muerto = true
		body.muerto()			
		get_tree().reload_current_scene()
