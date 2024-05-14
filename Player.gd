extends CharacterBody2D

@export var currentGravity : float = 800.0
var moveSpeed : float = 100.0
@export var jumpForce : float = 200.0
var facingLeft : bool = false
var score = 0
@export var rotationSpeed = 2;

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
		velocity.y = -jumpForce * (currentGravity / 500.0)
		$AnimatedSprite2D.play("Jump")
		$AudioStreamPlayer.play()
	elif velocity.y < 0 and $AnimatedSprite2D.animation != "Jump":
		$AnimatedSprite2D.play("Jump")
	
	move_and_slide()

func _on_moonrock_body_entered(body):
	score += 1
	print(score)
