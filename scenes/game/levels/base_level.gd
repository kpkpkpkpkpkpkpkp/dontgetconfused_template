extends Node2D

export var path_to_scene : String

signal goto_room(room)
signal goto_main

func _on_transition_entered(_body : PhysicsBody2D):
	emit_signal("goto_room", load(path_to_scene))

func _on_quit_entered(_body : PhysicsBody2D):
	emit_signal("goto_main")
