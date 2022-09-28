extends Control

signal starting(game_scene_arg)
export var game_scene:PackedScene

func _input(event):
	if event.is_action_pressed("ui_accept"):
		start_game()
	
func start_game():
	$StartSFX.play()
	emit_signal("starting",game_scene)
	yield($StartSFX,"finished")
	#Instead of using change_scene(), we can free the menu once the sound effect is done playing
	queue_free()

