extends Node2D

@onready var music = preload("res://sounds/Moonlight Hall.mp3.mp3")

func _ready() -> void:
	VariaveisGlobais.player_life = 3
	MusicPlayer.music_level = music
	MusicPlayer.play_music_level()
