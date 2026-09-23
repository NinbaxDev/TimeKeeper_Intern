extends CharacterBody2D

var life = 10
var player = null
var direction := 1
@export var SPEED := 80.0
@export var left_limit := 0.0
@export var right_limit := 0.0
@export var vertical_limit := 720.0
@onready var sprite = $AnimatedSprite2D
@onready var sfx_dano: AudioStreamPlayer2D = $sfx_dano

func take_damage(amount: int) -> void:
	print("Damage: ", amount)
	life -= amount
	sfx_dano.play()

func _ready() -> void:
	sprite.play("idle")
	player = get_tree().get_root().get_node("clock_scene/Player")

func _physics_process(delta):
	if not player:
		return
	var direction_to_player = (player.global_position - global_position).normalized()
	# Movimento lateral + movimento vertical limitado
	var new_position = global_position + direction_to_player * SPEED * delta
	if new_position.y > vertical_limit:
		new_position.y = vertical_limit
	global_position = new_position
	if life == 0:
		VariaveisGlobais.inimigos_mortos += 1
		queue_free()
