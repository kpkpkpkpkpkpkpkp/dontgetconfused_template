extends "res://scenes/game/levels/base_level.gd"

func _ready():
	$StarPlayer.play("twinkle")

func _on_enemy_slept():
	sleeping_enemies+=1
	if sleeping_enemies>=enemy_count:
		#Show some thing to say you won and go back to main menu
		emit_signal("goto_main")
