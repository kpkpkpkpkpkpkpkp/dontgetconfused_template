extends CanvasModulate

signal faded_out
signal faded_in

func fade_out():
	$FadePlayer.play("fade_out")
	yield($FadePlayer,"animation_finished")
	emit_signal("faded_out")
	
func fade_in():
	$FadePlayer.play("fade_in")
	yield($FadePlayer,"animation_finished")
	emit_signal("faded_in")
