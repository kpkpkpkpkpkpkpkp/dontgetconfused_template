extends "res://scenes/game/characters/base_guy.gd"

signal slept

func get_sleepy():
	#The only difference between the player and the enemies is that the enemies can go to sleep when hit by a music note.
	#This function adds that functionality to base_guy.tscn
	$BalloonSprite.frame=1
	$SnoreSFX.play()
	emit_signal("slept")
