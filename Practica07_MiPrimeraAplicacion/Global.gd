extends Node

var monedas := 0 : 
	set(val):
		monedas = val
		if player != null:
			player.actualizaInterfazMonedas()
			$MonedaSonido.play()
		
	get:
		return monedas
		
var Power := 0 : 
	set(val):
		Power = val
		if player != null:			
			$PowerUP.play()
		
	get:
		return Power

var player

var muerto := false :
	set(val):
		muerto = val
		if player != null:
			player.muerto
			
		$MuerteSonido.play()
		
	get:
		return muerto
		
	

var seconds = 0
var minutes = 0

func _on_time_timeout():
	if seconds == 59:
		minutes += 1
		seconds = 0
		
	seconds += 1
	if player != null:
		player.actualizaInterfazTiempo()
	
