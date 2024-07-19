extends TextureButton

const DINO_WORLD_SCENE = "res://Scenes/Stages/dino_world.tscn"

func _pressed():
	_on_scene_change(DINO_WORLD_SCENE)
	
@onready var _anim = $"../../anim"
@onready var _flash_frame = $"../../ColorRect"
@onready var _scene_change = sound_player.get_node("SceneChangeAudioStream")

func _on_scene_change(scene):
	_scene_change.play()
	_flash_frame.show()
	_anim.play("fade_in")
	await _anim.animation_finished
	get_tree().change_scene_to_file(scene)
	_anim.play("fade_out")
	await _anim.animation_finished
	_flash_frame.hide()
