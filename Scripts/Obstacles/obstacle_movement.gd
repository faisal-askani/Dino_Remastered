extends Area2D

signal hit

func _process(delta):
	position.x -= GameManager.game_speed

func _on_area_entered(area):
	#print("area enter: ", area.name)
	#if area.name == "DinoArea":
		#print("Obstacle: ", area.name)
		##hit.emit()
	pass
