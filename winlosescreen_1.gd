extends Control

@onready var texto = $CanvasLayer/texto_de
var i = 0

func _ready() -> void:
	visible = false

func _process(delta: float) -> void:
	if VariaveisGlobais.mission_fail and i == 0:
		text_lose()

func text_win():
	visible = true
	texto.text = str("WIN")
	change_scene()
	await get_tree().create_timer(2).timeout
	texto.text = str("THE DAY IS ENDING")
	await get_tree().create_timer(2).timeout
	texto.text = str("GO BACK TO YOUR ROOM")

func text_lose():
	visible = true
	texto.text = str("LOSE")
	change_scene_lose()
	await get_tree().create_timer(2).timeout
	texto.text = str("THE DAY IS NOT OVER AND YOU LOST")
	await get_tree().create_timer(2).timeout
	texto.text = str("GO BACK TO YOUR ROOM")

func change_scene():
	await get_tree().create_timer(6).timeout
	VariaveisGlobais.trocar_para_cena("res://Scenes/room_scene.tscn")

func change_scene_lose():
	VariaveisGlobais.mission_fail = true
	await get_tree().create_timer(6).timeout
	VariaveisGlobais.trocar_para_cena("res://Scenes/room_scene.tscn")
