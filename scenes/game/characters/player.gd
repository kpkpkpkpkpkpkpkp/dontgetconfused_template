extends KinematicBody2D

export var speed := 200

func _physics_process(delta):
	var x=Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	var y=Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	move_and_slide(Vector2(x,y)*speed)
