extends ParallaxBackground


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ParallaxLayer3.motion_offset.x += 50 * delta
