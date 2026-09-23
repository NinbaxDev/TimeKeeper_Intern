extends Node2D

@onready var music_combat = preload("res://sounds/Exotic Battle.mp3")

func _ready() -> void:
	MusicPlayer.music_level = music_combat
	MusicPlayer.play_music_level()
