extends Area2D

@onready var sprite = $AnimatedSprite2D
@onready var tempo_de_troca = $Timer
@onready var screen = $"../Winlosescreen1"
var life = 5
var locais = 0

func _ready() -> void:
	VariaveisGlobais.time_machine_die = false
	VariaveisGlobais.inimigos_mortos = 0
	position = $Marker2D4.position
	tempo_de_troca.start()

func _process(_delta: float) -> void:
	if VariaveisGlobais.time_machine_die:
		screen.text_lose()
		queue_free()
	if VariaveisGlobais.timer_end:
		VariaveisGlobais.clock_scene_complete = true
		VariaveisGlobais.dia += 1
		screen.text_win()
		queue_free()

func _on_timer_timeout() -> void:
	if locais >= 4:
		locais = 0
	locais += 1
	change_location()

func change_location():
	if locais == 1:
		position = $Marker2D.position
		tempo_de_troca.start()
	if locais == 2:
		position = $Marker2D2.position
		tempo_de_troca.start()
	if locais == 3:
		position = $Marker2D3.position
		tempo_de_troca.start()
	if locais == 4:
		position = $Marker2D4.position
		tempo_de_troca.start()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		take_damage()

func take_damage():
	life -= 1
	print("Vida: ", life)
	if life == 4:
		sprite.play("hit_1")
	if life == 3:
		sprite.play("hit_2")
	if life == 2:
		sprite.play("hit_3")
	if life == 1:
		sprite.play("hit_4")
	if life == 0:
		sprite.play("hit_5")
		VariaveisGlobais.time_machine_die = true
