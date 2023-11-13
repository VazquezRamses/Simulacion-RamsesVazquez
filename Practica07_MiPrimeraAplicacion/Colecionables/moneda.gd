extends Area2D

func _ready():
	$AnimatedSprite2D.play("Moneda")

func _on_body_entered(body):
	if body is Player:
		Global.monedas += 1
		queue_free()
