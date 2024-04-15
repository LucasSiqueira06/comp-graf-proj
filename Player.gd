extends CharacterBody2D

var moveSpeed : float = 100.0
var jumpForce : float = 200.0
var currentGravity : float = 500.0

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += currentGravity * delta
	
	velocity.x = 0
	
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x -= moveSpeed
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x += moveSpeed
