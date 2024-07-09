class_name InitialState extends State

var _first_time = 0

func _enter_state():
	print("enter initial state")

func _exit_state():
	print("exit initial state")
	
	#if _first_time > 0:
		#game_running.emit()
		#
	#_first_time += 1
