class_name GameManager extends Node

@export var _initial_speed = 5.0
@export var _speed_increase = 0.1

static var game_speed = 0.0
static var obstacle_speed = 0.0

func _start():
	print("game manager physics start")
	set_process(true)

func _stop():
	print("game manager physics stop")
	set_process(false)

func _ready():
	set_process(false)
	game_speed = _initial_speed

func _process(delta):
	obstacle_speed += _speed_increase 
	game_speed += _speed_increase * delta

func _on_game_running_state_run_manager():
	_start()

func _on_game_over_state_stop_manager():
	_stop()

#public static GameManager Instance { get; private set; }
#public float initialGameSpeed = 5f;
#public float gameSpeedIncrease = 0.1f;
#public float gameSpeed { get; private set; }

#gameSpeed += gameSpeedIncrease * Time.deltaTime;
#score += gameSpeed * Time.deltaTime;



