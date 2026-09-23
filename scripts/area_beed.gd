extends Area2D

@onready var next_day = $"../next_day_layer"
@onready var button = $"../next_day_layer/Next_day_button"
func _ready() -> void:
	next_day.visible = false
	button.visible = false

func _on_body_entered(_body: Node2D) -> void:
	next_day.visible = true
	button.visible = true

func _on_body_exited(_body: Node2D) -> void:
	next_day.visible = false
	button.visible = false

func _on_next_day_button_pressed() -> void:
	$"../sfx_click".play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://transition_day_scene.tscn")
