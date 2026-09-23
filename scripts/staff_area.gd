extends Area2D

@onready var sprite = $staff
@onready var screen = $"../Winlosescreen1"
func _ready() -> void:
	sprite.play("idle")

func _on_body_entered(_body: Node2D) -> void:
	if _body.is_in_group("Player"):
		$sfx_pickup.play()
		VariaveisGlobais.dia += 1
		screen.text_win()
		VariaveisGlobais.mechanic_scene_complete = true
		queue_free()
