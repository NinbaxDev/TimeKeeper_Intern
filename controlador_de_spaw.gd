extends Node

@onready var tempo_l = $tempo_limite
@onready var tempo_g = $tempo_ghost
@onready var tempo_b = $tempo_ball
@onready var tempo_t = $tempo_troca
@onready var ghost = preload("res://Scenes/enemy_ghost.tscn")
@onready var ball = preload("res://Scenes/ball_enemy.tscn")
var limit = 0
var spaw_g = 1
var spaw_b = 1

func _ready() -> void:
	tempo_l.start()
	tempo_g.start()
	tempo_b.start()
	tempo_t.start()

func _on_tempo_limite_timeout() -> void:
	tempo_g.queue_free()
	tempo_b.queue_free()

func _on_tempo_ghost_timeout() -> void:
	var enemy_g = ghost.instantiate()
	if spaw_g == 1:
		enemy_g.position = $Marker2D2.position
	if spaw_g == 2:
		enemy_g.position = $Marker2D.position
	if spaw_g == 3:
		enemy_g.position = $Marker2D3.position
	add_child(enemy_g)
	limit += 1
	tempo_g.start()
	print("limit ", limit)

func _on_tempo_ball_timeout() -> void:
	var enemy_b = ball.instantiate()
	if spaw_b == 1:
		enemy_b.position = $Marker2D4.position
	if spaw_b == 2:
		enemy_b.position = $Marker2D5.position
	add_child(enemy_b)
	limit += 1
	tempo_b.start()
	print("limit ", limit)

func _on_tempo_troca_timeout() -> void:
	spaw_g += 1
	spaw_b += 1
	if spaw_g > 3:
		spaw_g = 1
	if spaw_b > 2:
		spaw_b = 1 
	tempo_t.start()
