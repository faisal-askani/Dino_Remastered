class_name GameManager extends Node

@export var _initial_speed = 5.0
@export var _speed_increase = 0.1

static var game_speed = 0.0
static var obstacle_speed = 0.0
static var score = 0.0
static var previous_score = false


func _start():
	print("game manager physics start")
	game_speed = _initial_speed
	obstacle_speed = 0.0
	score = 0
	previous_score = false
	set_process(true)

func _stop():
	print("game manager physics stop")
	set_process(false)
	if  score > global_score.data.high_score:
		print("score is: ", score, " global score is: ", global_score.data.high_score)
		previous_score = true
		global_score.data.high_score = score
		global_score.data.save()

func _ready():
	set_process(false)
	game_speed = _initial_speed
	obstacle_speed = 0.0
	score = 0.0

func _process(delta):
	obstacle_speed += _speed_increase 
	game_speed += _speed_increase * delta
	score += game_speed * delta

func _on_game_running_state_run_manager():
	_start()

func _on_game_over_state_stop_manager():
	_stop()

