class_name GameOverState extends State

signal stop_spawning
signal stop_manager
signal stop_background
signal show_gameover

func _enter_state():
	print("enter gameover state")
	stop_spawning.emit()
	stop_manager.emit()
	stop_background.emit()
	show_gameover.emit()

func _exit_state():
	print("exit gameover state")
