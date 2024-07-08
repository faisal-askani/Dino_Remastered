class_name SpawnStartState extends State

class Obstacle:
	var scene: PackedScene 
	var chance: float

@export var scenes: Array[PackedScene]
@export var chances: Array[float]

@onready var timer = Timer.new()

var obstacles: Array[Obstacle] 
var min_spawn_rate = 1.5
var max_spawn_rate = 3.0


func _enter_state():
	print("enter spawn start state")
	timer.start()

func _exit_state():
	print("exit spawn start state")
	timer.stop()

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
	print("This is spawn and timer is ", timer.wait_time, 
		  " randf: ", spawn_chance)
	
	timer.stop()
	
	for obj in obstacles:
		if spawn_chance < obj.chance:
			var obstacle = obj.scene.instantiate() 
			obstacle.position = Vector2(1280, 448)
			add_child(obstacle)
			break
		spawn_chance -= obj.chance
		
	timer.wait_time = randf_range(min_spawn_rate, max_spawn_rate)
	timer.start()


#public float minSpawnRate = 1f;
#public float maxSpawnRate = 2f;

#c_s_single = 0.2
#c_l_single = 0.18
#
#c_s_double = 0.16
#c_l_double = 0.14
#
#c_s_triple = 0.12
#c_l_triple = 0.1
#
#bird = 0.05
