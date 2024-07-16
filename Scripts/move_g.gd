extends ParallaxBackground


func _process(delta):
	scroll_offset.x -= GameManager.game_speed
	
