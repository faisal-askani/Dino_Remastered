class_name Spawning extends Node2D

class Obstacle:
	var scene: PackedScene 
	var chance: float

@export var scenes: Array[PackedScene]
@export var chances: Array[float]

@onready var timer = Timer.new()
@onready var dino = $"../Dino" as Dino

var obstacles: Array[Obstacle] 
var min_spawn_rate = 1.5
var max_spawn_rate = 3.0


func _start():
	print("spawning start")
	timer.start()

func _stop():
	print("spawning stop")
	for obs in get_children().filter(func (child): return child is Area2D):
		obs.set_process(false)
	timer.stop()

func _destroy_obstacles():
	for obs in get_children().filter(func (child): return child is Area2D):
		obs.queue_free()

func _ready():
	for i in range(0,7):
		var obstacle = Obstacle.new()
		obstacle.scene = scenes[i]
		obstacle.chance = chances[i]
		obstacles.append(obstacle)
	
	timer.wait_time = 1
	timer.connect("timeout", _spawn)
	add_child(timer)

func _spawn():
	var spawn_chance = randf() 
	#print("This is spawn and timer is ", timer.wait_time, 
		  #" randf: ", spawn_chance)
	
	timer.stop()
	
	for obj in obstacles:
		if spawn_chance < obj.chance:
			var obstacle = obj.scene.instantiate() 
			obstacle.hit.connect(dino.on_obstacle_area_entered)
			obstacle.position = Vector2(1930, 541.7)
			if obstacle.name == "Bird":
				obstacle.position = Vector2(1930, 350)
			add_child(obstacle)
			break
		spawn_chance -= obj.chance
		
	timer.wait_time = randf_range(min_spawn_rate, max_spawn_rate)
	timer.start()

func _on_game_running_state_start_spawning():
	_start()

func _on_game_over_state_stop_spawning():
	_stop()

func _on_game_over_state_restart_game():
	_destroy_obstacles()
