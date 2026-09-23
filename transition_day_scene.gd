extends Node2D

@onready var button = $Play_button
@onready var comum_text = $Label
@onready var demitido_text = $Label2
@onready var congratulations_text = $Congratulations

func _ready() -> void:
	if VariaveisGlobais.dia == 5:
		congratulations_text.visible = true
		demitido_text.visible = false
		comum_text.visible = false
	else:
		demitido_text.visible = false
		congratulations_text.visible = false
		comum_text.visible = true
		if VariaveisGlobais.mission_fail:
			demitido_text.visible = true
			comum_text.visible = false
			congratulations_text.visible = false
	button.visible = false
	await get_tree().create_timer(2).timeout
	button.visible = true

func _on_play_button_pressed() -> void:
	$sfx_click.play()
	await get_tree().create_timer(0.5).timeout
	if VariaveisGlobais.dia == 5:
		VariaveisGlobais.dia = 0
		VariaveisGlobais.clock_scene_complete = false
		VariaveisGlobais.mechanic_scene_complete = false
		VariaveisGlobais.trocar_para_cena("res://Scenes/menu_screen.tscn")
	else:
		if VariaveisGlobais.day1 == 0:
			VariaveisGlobais.day1 += 1
			VariaveisGlobais.dia += 1
			VariaveisGlobais.trocar_para_cena("res://Scenes/clock_scene.tscn")
		if VariaveisGlobais.mechanic_scene_complete and VariaveisGlobais.dia <= 4:
			VariaveisGlobais.mechanic_scene_complete = false
			VariaveisGlobais.trocar_para_cena("res://Scenes/clock_scene.tscn")
		if VariaveisGlobais.clock_scene_complete and VariaveisGlobais.dia <= 4:
			VariaveisGlobais.clock_scene_complete = false
			VariaveisGlobais.trocar_para_cena("res://Scenes/mechanic_scene.tscn")
		if VariaveisGlobais.mission_fail:
			VariaveisGlobais.dia = 0
			VariaveisGlobais.mission_fail = false
			VariaveisGlobais.clock_scene_complete = false
			VariaveisGlobais.mechanic_scene_complete = false
			VariaveisGlobais.trocar_para_cena("res://Scenes/menu_screen.tscn")
	
