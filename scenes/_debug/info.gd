extends CanvasLayer

#This scene can be instanced to view debug information about the player character's velocity and whether they're floating.
#It can be toggled on and off using the 'Debug' property in the editor.

export var player_path:NodePath
export var debug:=false
var player:KinematicBody2D

func _ready():
	if debug:
		visible=true
	player=get_node(player_path)
	
func _process(_delta):
	$InfoBox/Floating.text="Player floating: %s"%player.floating
	$InfoBox/Velocity.text=" Velocity: %s"%player.velocity
