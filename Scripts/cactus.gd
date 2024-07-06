class_name Cactus extends Area2D

#@export var _dino: Dino

#func _on_body_entered(body):
	#print("Body enter: ", body.name)
	#_dino.fsm.change_State(_dino.dino_crashed_state)
