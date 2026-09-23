extends Node

@onready var label = $Label
@onready var timer = $Timer

func tempo_resta():
	var tempo_restante = timer.time_left
	var minutagem = floor(tempo_restante / 60)
	var segundos = int(tempo_restante) % 60
	return [minutagem, segundos]

func _ready() -> void:
	timer.wait_time = 60.0
	timer.start()

func _process(_delta):
	label.text = "%02d:%02d" % tempo_resta()
	if VariaveisGlobais.is_open and not VariaveisGlobais.timer_resetou == true:
		timer.wait_time = 60.0
		timer.start()
		VariaveisGlobais.timer_resetou = true
	
