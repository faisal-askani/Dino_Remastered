class_name GameRunningState extends State

signal start_spawning
signal run_manager
signal run_background
signal run_score

func _enter_state():
	print("enter game running state")
	start_spawning.emit()
	run_manager.emit()
	run_background.emit()
	run_score.emit()
	

func _exit_state():
	print("exit game running state")



## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
