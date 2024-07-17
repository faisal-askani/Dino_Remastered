extends ParallaxBackground


func _start():
	print("start parallaxbackground")
	set_process(true)

func _stop():
	print("stop parallaxbackground")
	set_process(false)

func _ready():
	set_process(false)

func _process(delta):
	scroll_offset.x -= GameManager.game_speed

func _on_game_running_state_run_background():
	_start()

func _on_game_over_state_stop_background():
	_stop()
