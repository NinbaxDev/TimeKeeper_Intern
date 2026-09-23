extends Node
##esse script serve pra variáveis globais, ou seja, que precisam
##ser acessadas por múltiplos scripts ao mesmo tempo, separar tudo nesse
##arquivo torna tudo mais fácil. (Felipe)

var can_dash = false 
var is_open: bool = false
var timer_resetou: bool = false
var time_machine_die: bool = false
var player_life = 3
var mechanic_scene_complete:bool = false
var clock_scene_complete:bool = false
var mission_fail: bool = false
var timer_end: bool = false
var player_die: bool = false
var inimigos_mortos: int = 0
var dia = 0
var day1 = 0

func trocar_para_cena(caminho: String) -> void:
	get_tree().change_scene_to_file(caminho)
