extends Area2D

@export var knockback := 500
@onready var screen = $"../Winlosescreen1"

func _on_body_entered(_body: Node2D) -> void:
	if _body.is_in_group("Player"):
		$sfx_dano.play()
		VariaveisGlobais.player_life -= 1
		_body.knockback = position.direction_to(_body.position) * knockback
	if VariaveisGlobais.player_life == 0:
		screen.text_lose()
