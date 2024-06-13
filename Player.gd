extends CharacterBody2D

# Defina a gravidade na Terra
var GRAVITY_EARTH = 800.0

# Variável para armazenar a gravidade atual
var currentGravity = GRAVITY_EARTH

var moveSpeed : float = 190.0
@export var jumpForce : float = 300
var facingLeft : bool = false
var score = 0

# variável para rastrear se o Purple Ingot foi coletado
var hasPurpleIngot = false

@export var rotationSpeed = 2;

func collect_purple_ingot():
	hasPurpleIngot = true
	print("purple true")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += currentGravity * delta
		rotate(rotationSpeed * delta)
	else:
		if(rotation_degrees < PI / 2 || rotation_degrees > 3 * PI / 2):
			rotation_degrees = 0
	
	velocity.x = 0
	
	if Input.is_key_pressed(KEY_LEFT):
		if not facingLeft:
			$AnimatedSprite2D.scale.x *= -1
			facingLeft = true
		velocity.x -= moveSpeed
		$AnimatedSprite2D.play("Run")
	elif Input.is_key_pressed(KEY_RIGHT):
		if facingLeft:
			$AnimatedSprite2D.scale.x *= -1
			facingLeft = false
		velocity.x += moveSpeed
		$AnimatedSprite2D.play("Run")
	else:
		if is_on_floor():
			$AnimatedSprite2D.play("Idle")
	
	if is_on_floor() and Input.is_key_pressed(KEY_SPACE):
		velocity.y = -jumpForce
		$AnimatedSprite2D.play("Jump")
		$AudioStreamPlayer.play()
	elif velocity.y < 0 and $AnimatedSprite2D.animation != "Jump":
		$AnimatedSprite2D.play("Jump")
	
	move_and_slide()

func _on_moonrock_body_entered(body):
	score += 1
	print(score)

# Adicione uma função para alterar a gravidade quando o jogador entra em Vênus
func _ready():
	var root = get_tree().get_root()
	var current_scene = root.get_child(root.get_child_count() - 1)
	var scene_name = current_scene.get_name()

	if scene_name == "Venus":
		currentGravity = GRAVITY_EARTH * 0.904  # A gravidade em Vênus é 0.904 vezes a gravidade na Terra
	else:
		currentGravity = GRAVITY_EARTH
