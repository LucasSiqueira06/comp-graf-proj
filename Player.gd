extends CharacterBody2D

var moveSpeed : float = 100.0
var jumpForce : float = 200.0
var currentGravity : float = 500.0
var facingLeft : bool = false

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += currentGravity * delta
	else:
		velocity.y = 0
	
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
	elif velocity.y < 0 and $AnimatedSprite2D.animation != "Jump":
		$AnimatedSprite2D.play("Jump")
	
	move_and_slide()
