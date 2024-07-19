extends Area2D

signal hit

func _process(delta):
	position.x -= 5.0 + GameManager.obstacle_speed * delta
	if position.x < -100:
		queue_free()

func _on_area_entered(area):
	print("area enter: ", area.name)
	if area.name == "DinoArea":
		print("Obstacle: ", area.name)
		#hit.emit()
