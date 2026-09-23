extends CanvasLayer

@onready var player = $".."

func _ready() -> void:
	visible = false

func hide_menu():
	visible = false
	get_tree().paused = false

func show_menu():
	visible = true
	get_tree().paused = true

func _on_back_pressed() -> void:
	$"../sfx_click".play()
	await get_tree().create_timer(0.2).timeout
	hide_menu()

func _on_exit_pressed() -> void:
	$"../sfx_click".play()
	await get_tree().create_timer(0.2).timeout
	hide_menu()
	VariaveisGlobais.trocar_para_cena("res://menu_screen.tscn")
