extends Sprite2D
##Esse script é o que serve pra desbloquear habilidades, básicamente você chega
##perto do objetivo, aperta o input de interagir (K) e ele habilita o dash, 
##mas isso pode ser mudado pra qualquer outra habilidade com um
##pouco de mudanças no script. (Felipe)
@onready var jogador = $"../Player"

var is_player_inside: bool = false

# interagir - Tecla K
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interagir") and is_player_inside and not VariaveisGlobais.is_open:
		VariaveisGlobais.timer_resetou = false
		VariaveisGlobais.is_open = true
		VariaveisGlobais.can_dash = true
		jogador.position.x = 80
		jogador.position.y = 0
		

func _on_area_2d_player_entered(_player: CharacterBody2D) -> void:
	is_player_inside = true

func _on_area_2d_area_exited(_player: CharacterBody2D) -> void:
	is_player_inside = false
