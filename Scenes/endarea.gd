extends Area2D

func _ready():
	connect("body_entered",Callable (self, "_on_body_entered"))

func _on_body_entered(body):
	if body.name == "Player" and body.hasPurpleIngot: 
		get_tree().goto_scene("res://Scenes/endscreen.tscn")


