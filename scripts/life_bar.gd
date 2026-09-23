extends TextureProgressBar

var i: int = 0

func _process(_delta: float) -> void:
	max_value = 3.0
	value = VariaveisGlobais.player_life
	if VariaveisGlobais.player_life == 0 and i == 0:
		VariaveisGlobais.mission_fail = true
