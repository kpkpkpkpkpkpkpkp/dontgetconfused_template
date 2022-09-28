extends Node2D

#NOTE: Since we are loading this scene as an export in the title, this stuff runs as soon as title.tscn is loaded.
#	In this case, this is when the game starts. 

signal end_game

export var start_scene:PackedScene
var current_level:Node2D
const LEVEL_HEIGHT = 340

#This runs as soon as an instance of "game.tscn" enters the scene tree, which means whenever you add it with "add_child()"
func _ready():
	#This is how we enter the first scene. It will be loaded and added as soon as we start the game.
	#	You can change the starting scene by setting a different scene file in the editor.
	current_level=start_scene.instance()
	$Levels.add_child(current_level)
	current_level.connect("goto_room",self,"_on_goto_room")
	current_level.connect("goto_main",self,"_on_goto_main")
	$WorldCam.current=true

func _on_goto_room(scene:PackedScene):
	#If we instance the new level insted of using change_scene(), we can do our setup in between. 
	#like using a tween to slowly move the camera to the new area.
	
	var new_level=scene.instance()
	$Levels.add_child(new_level)
	#Offset this level to our position + or - its width or height 
	#in the direction we want it to go
	new_level.position=current_level.position+(Vector2.UP*LEVEL_HEIGHT)
	new_level.connect("goto_room",self,"_on_goto_room")
	new_level.connect("goto_main",self,"_on_goto_main")
	var tw=get_tree().create_tween()
	tw.tween_property($WorldCam,"position",new_level.position,1)
	
	tw.tween_callback(current_level,'queue_free')
	current_level=new_level
	
func _on_goto_main():
	emit_signal("end_game")
	
func _input(event):
	if event.is_action_pressed("ui_pause"):
		get_tree().paused=!get_tree().paused
		$PauseLayer.visible=get_tree().paused
