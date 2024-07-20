extends TextureButton

func _pressed():
	scene_manager._on_scene_change(scene_manager.DINO_WORLD_SCENE)
