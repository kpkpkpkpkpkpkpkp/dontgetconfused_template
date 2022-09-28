extends Area2D


signal transition_entered(room)

export var transition_scene: String

func _ready():
	load(transition_scene)

func _on_body_entered(body):
	if body is KinematicBody2D and transition_scene!='':
		emit_signal("transition_entered", load(transition_scene))
		
