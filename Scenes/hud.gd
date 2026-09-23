extends CanvasLayer

func _ready() -> void:
	var cur_scene = get_tree().current_scene.scene_file_path
	if cur_scene == "res://Scenes/room_scene.tscn":
		hide()
