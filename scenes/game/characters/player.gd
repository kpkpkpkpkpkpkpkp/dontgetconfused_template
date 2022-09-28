extends "res://scenes/game/characters/base_guy.gd"

export var note_scene:PackedScene


func _physics_process(_delta):
	
	if Input.is_action_just_pressed("ui_float"):
		#do this here so it only starts once
		$FloatAnimationPlayer.play("float")
	elif Input.is_action_just_released("ui_float"):
		#The "false" argument pauses the player instead of stopping it, 
		#so it will continue from the last spot when we start playing again
		$FloatAnimationPlayer.stop(false)
		floating=false
	
	if Input.is_action_pressed("ui_float"):
		#do this here so it always keeps us floating no matter what gets released
		#If multiple inputs are mapped to one action, releasing one will trigger action released 
		#even if the other is still held
		floating=true
	
	if Input.is_action_pressed("ui_float_left"):
		if velocity.x>-MAX_H_SPEED:
			velocity.x-=FLOAT_SPEED
	if Input.is_action_pressed("ui_float_right"):
		if velocity.x<MAX_H_SPEED:
			velocity.x+=FLOAT_SPEED
		
func _input(event):
	if event.is_action_pressed("ui_float_up"):
		go_up()
	if event.is_action_pressed("ui_sing"):
		$FloatAnimationPlayer.play("sing")

func song():
	$ChimeSFX.play()
	var note=note_scene.instance()
	get_parent().add_child(note)
	note.position=position
	note.direction=direction
	
	#Pause ourselves until the animation is done
	yield($FloatAnimationPlayer,"animation_finished")
	$FloatAnimationPlayer.play("float")
