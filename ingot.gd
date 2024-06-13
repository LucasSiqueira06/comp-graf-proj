extends Area2D


@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	if body is CharacterBody2D:
		print("Voce coletou o PurpleIngot")
		body.collect_purple_ingot()
		animation_player.play("pickup")
