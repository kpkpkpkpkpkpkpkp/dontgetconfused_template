extends KinematicBody2D

var direction:=Vector2.RIGHT
const SPEED=100

func _ready():
	$AnimationPlayer.play("jiggle")
	
func _physics_process(_delta):
	move_and_slide((direction+Vector2.UP)*SPEED, Vector2.UP)

func _on_NoteRangeArea_body_entered(body):
	#This is for madguy. 
	#Because of our collision layer, madguy is the only kinematicbody we'll be able to collide with.
	if body is KinematicBody2D:
		body.get_sleepy()
		#Only sleep one guy per note. If we didn't do this, the note could keep going and sleep multiple guys.
		queue_free()
		
	elif body is StaticBody2D:
		#Also dispose of the note if it bumps into the wall
		queue_free()
