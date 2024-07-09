class_name GameOverState extends State

signal stop_spawning
signal stop_manager

func _enter_state():
	print("enter gameover state")
	stop_spawning.emit()
	stop_manager.emit()

func _exit_state():
	print("exit gameover state")

## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
