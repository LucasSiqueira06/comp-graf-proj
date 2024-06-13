extends Path2D


@export var loop = true
@export var speed = 2.0
@export var speed_scale = 1.0
@export var animation_angle = 0

@onready var path = $PathFollow2D
@onready var animation = $AnimationPlayer
@onready var animate = $AnimatableBody2D
# Called when the node enters the scene tree for the first time.
func _ready():
	if not loop:
		animation.play("move")
		animation.speed_scale = speed_scale
		animate.rotation_degrees = animation_angle
		set_process(false)
		
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	path.progress += speed
