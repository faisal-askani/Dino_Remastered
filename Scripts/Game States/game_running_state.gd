class_name GameRunningState extends State

signal start_spawning
signal run_manager
signal run_background
signal run_score
signal show_high_score

func _enter_state():
	print("enter game running state")
	start_spawning.emit()
	run_manager.emit()
	run_background.emit()
	run_score.emit()
	show_high_score.emit()

func _exit_state():
	print("exit game running state")

