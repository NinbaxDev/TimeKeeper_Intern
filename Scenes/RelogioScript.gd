extends Timer

func _ready() -> void:
	var cur_scene = get_tree().current_scene.scene_file_path
	if cur_scene != "res://Scenes/room_scene.tscn":
		VariaveisGlobais.timer_end = false
		wait_time = 60.0
		start()

func _process(_delta: float) -> void:
	if VariaveisGlobais.mechanic_scene_complete or VariaveisGlobais.clock_scene_complete or VariaveisGlobais.time_machine_die or VariaveisGlobais.mission_fail:
		stop()

func _on_timeout() -> void:
	wait_time = 60.0
	VariaveisGlobais.timer_end = true
	start()
