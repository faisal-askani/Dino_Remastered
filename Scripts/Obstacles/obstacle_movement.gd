extends Area2D

signal hit

func _process(delta):
	position.x -= delta * 250

func _on_area_entered(area):
	print("Obstacle: ", area.name)
	hit.emit()
