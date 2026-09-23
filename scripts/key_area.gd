extends Area2D

@onready var wall = $"../wall_key"
@onready var key = $key_sprite

func _ready() -> void:
	key.play("rot")

func _on_body_entered(_body: Node2D) -> void:
	if _body.is_in_group("Player"):
		$sfx_pickup.play()
		wall.queue_free()
		queue_free()
