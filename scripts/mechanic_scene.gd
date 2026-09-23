extends Node2D

@onready var music = preload("res://sounds/Lord of the Land.mp3")

func _ready() -> void:
	MusicPlayer.music_level = music
	MusicPlayer.play_music_level()
