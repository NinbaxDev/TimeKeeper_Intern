extends Control

@export_category("Musicas")
@export var music1 = AudioStream
@export var music2 = AudioStream
@export var music3 = AudioStream

func _on_back_pressed() -> void:
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/menu_screen.tscn")

func _on_music_1_pressed() -> void:
	MusicPlayer.music_level = music1
	MusicPlayer.play_music_level()

func _on_music_2_pressed() -> void:
	MusicPlayer.music_level = music2
	MusicPlayer.play_music_level()

func _on_music_3_pressed() -> void:
	MusicPlayer.music_level = music3
	MusicPlayer.play_music_level()
