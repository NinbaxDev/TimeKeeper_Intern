extends Control

@onready var control_text = $control_text/Label
@onready var music = preload("res://sounds/Moonlight Hall.mp3.mp3")

func _ready() -> void:
	VariaveisGlobais.day1 = 0
	MusicPlayer.music_level = music
	MusicPlayer.play_music_level()

func _on_play_pressed() -> void:
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/room_scene.tscn")

func _on_config_credits_pressed() -> void:
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/config_credits.tscn")

func _on_exit_pressed() -> void:
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()

func _on_control_pressed() -> void:
	$AudioStreamPlayer2D.play()
	control_text.visible = true
	await get_tree().create_timer(5).timeout
	control_text.visible = false
