extends KinematicBody2D


const GRAVITY := 5.0
const MAX_GRAVITY := 100.0
const H_DRAG := 5.0
const MAX_H_SPEED := 200.0
const FLOAT_SPEED := 10.0

var floating := true
var velocity := Vector2.ZERO
var direction := Vector2.RIGHT


func _physics_process(_delta):
	#Holding space allows you to stay in place
	if !floating:
		if velocity.y < MAX_GRAVITY:
			velocity.y += GRAVITY
	else:
		velocity.y = 0.0
		
	if velocity.x >= 0:
		direction = Vector2.RIGHT
		$BalloonSprite.flip_h=false
	else:
		direction = Vector2.LEFT
		$BalloonSprite.flip_h=true
	
	#Apply drag so that we don't keep floating after releasing the button.
	#Floating point comparisons are very sensitive! checking for exact zero will often not work
	#use a very small number instead.
	if velocity.x > 0.01:
		velocity.x -= H_DRAG
	if velocity.x <- 0.01:
		velocity.x += H_DRAG

	move_and_slide(velocity, Vector2.UP)

func _ready():
	$FloatAnimationPlayer.play("float")

func go_up():
	$FloatAnimationPlayer.stop()
	floating = false
	#This is what makes PUSHING the button move us up in pulses rather than holding it.
	velocity.y = -200

	
