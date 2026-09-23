extends AudioStreamPlayer

var music_level = AudioStreamMP3

func play_music(music: AudioStream, volume = -10.0):
	if stream == music:
		return
	stream = music
	volume_db = volume
	play()

func play_music_level():
	play_music(music_level)
