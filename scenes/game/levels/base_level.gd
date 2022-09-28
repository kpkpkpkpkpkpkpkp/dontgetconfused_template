extends Node2D

signal goto_room(room)
signal goto_main

var enemy_count: = 0
var sleeping_enemies: = 0

func _ready():
	for enemy in $Enemies.get_children():
		#Only count each enemy once by connecting the signal as "ONESHOT". 
		#	otherwise hitting the same enemy will count towards the total needed to continue.
		enemy.connect('slept', self, '_on_enemy_slept',[],CONNECT_ONESHOT)
		enemy_count += 1

func _on_transition_entered(room):
	#Pass signal through so it can be attached to this node's parent,
	#	And the parent doesn't have to interact with this node's children. 
	emit_signal("goto_room", room)

func _on_enemy_slept():
	sleeping_enemies+=1
	if sleeping_enemies>=enemy_count:
		#Once all the madguys are sleeping, open the transition area so we can continue upwards
		$TransitionAreas/BarrierUp/CollisionShape2D.call_deferred('set_disabled', true)
		#Show arrow to indicate direction to the player
		$ArrowPlayer.play("blink")


