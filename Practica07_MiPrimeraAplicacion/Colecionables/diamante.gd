extends Area2D

func _ready():
	$AnimatedSprite2D.play("Power")

func _on_body_entered(body):
	if body is Player:
		Global.Power = true
		queue_free()
