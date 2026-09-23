extends CharacterBody2D

@onready var jumptimer = $TimerPuloDinamico
@onready var Pause_menu = $Pause_screen
@onready var Anim = $AnimatedSprite2D
@onready var Attacklength = $AttackLength
@onready var SwordSprite = $Melee/AnimatedSprite2D
@onready var AnimEspada = $Melee/AnimationPlayer
@onready var sfx_pulo: AudioStreamPlayer2D = $sfx_pulo
@onready var sfx_golpe: AudioStreamPlayer2D = $sfx_golpe

const SPEED = 300.0
const JUMP_VELOCITY = -600.0
const DASH_SP = 800.0
var isdashing = false 
var isattacking = false
var knockback: Vector2
@export_category("knockback valores")
@export var min_knockback := 100
@export var slow_knockback := 1.1

func _on_attack_length_timeout() -> void:
	isattacking = false

func _physics_process(delta: float) -> void:
	if knockback.length() > min_knockback:
		knockback /= slow_knockback
		velocity = knockback
		move_and_slide()
		return
	if not isattacking:
		AnimEspada.play("idle")
		SwordSprite.play("idle")
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		jumptimer.start()
		velocity.y = JUMP_VELOCITY
		Anim.play("idle")
		sfx_pulo.play()
	if Input.is_action_just_pressed("attack") and not isattacking:
		AnimEspada.play("ataque")
		SwordSprite.show()
		SwordSprite.play("golpe")
		Attacklength.start()
		sfx_golpe.play()
		isattacking = true
	if not isattacking:
		AnimEspada.play("idle")
	var direction := Input.get_axis("left", "right")
	if direction:
		Anim.play("Walk")
		Anim.flip_h = direction > 0
		SwordSprite.flip_h = direction < 0
		if direction > 0:
			SwordSprite.position.x = 20
		else:
			SwordSprite.position.x = -13
		if isdashing:
			velocity.x = direction * DASH_SP
		else:
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		Anim.play("idle")
	if Input.is_action_just_pressed("Dash") and VariaveisGlobais.can_dash == true and not is_on_floor():
			isdashing = true
			$DuracaoDash.start()
			VariaveisGlobais.can_dash = false
			$CooldownDash.start()
	move_and_slide()

func _on_timer_pulo_dinamico_timeout() -> void:
	if !Input.is_action_pressed("ui_accept"):
		if velocity.y < 0:
			velocity.y = -200
	else:
		pass
		

func _on_duracao_dash_timeout() -> void:
	isdashing = false

func _on_cooldown_dash_timeout() -> void:
		VariaveisGlobais.can_dash = true

func _input(event) -> void:
	if event.is_action_pressed("ui_cancel") and Pause_menu:
		if Pause_menu.visible:
			Pause_menu.hide_menu()
		else:
			Pause_menu.show_menu()
