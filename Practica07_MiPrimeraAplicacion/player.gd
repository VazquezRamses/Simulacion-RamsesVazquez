extends CharacterBody2D
class_name Player

var speed = 120 # How fast the player will move (pixels/sec).
var direccion := 0.0
var jump = 250
const gravity = 9

@onready var Animacion = $AnimatedSprite2D
@onready var Monedas_label = $PlayerGUI/HBoxContainer/Monedas_Label
@onready var Tiempo_Label = $PlayerGUI/Panel2/Timer_Label

func _ready():
	Animacion.play()	
	Global.player = self

func _physics_process(delta):		
	direccion = Input.get_axis("move_left", "move_right")
	velocity.x = direccion * speed		
		
	if direccion != 0:
		Animacion.animation = "Movimiento"
		Animacion.flip_v = false		
		Animacion.flip_h = direccion < 0
	else:
		Animacion.animation = "UyQuieto"
			
	
	if is_on_floor() and Input.is_action_just_pressed("move_up"):
		if Global.Power > 0:						
			velocity.y -= 500
			velocity.x = direccion * 500
			Global.Power = 0
		else:		
			velocity.y -= jump			
		
	if !is_on_floor():		
		velocity.y += gravity				
		Animacion.animation = "Salto"			
		
		
	move_and_slide()		
				
func actualizaInterfazMonedas():
	Monedas_label.text = str(Global.monedas)
	
func actualizaInterfazTiempo():
	Tiempo_Label.text = str(Global.minutes) + ":" + str(Global.seconds)	

func muerto():	
	Animacion.animation = "Muerte"	
	await (Animacion.animation_finished)
	
	
	

