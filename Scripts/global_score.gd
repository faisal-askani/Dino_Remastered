extends Node

var data : SaveData

func _ready():
	data = SaveData.load_or_create()
