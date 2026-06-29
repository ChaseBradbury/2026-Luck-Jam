extends Node

enum Scene {
	MAIN_MENU, OVERWORLD, LAB, BARN, SHOP
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_scene(scene: Scene):
	match scene:
		Scene.MAIN_MENU:
			get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
		Scene.OVERWORLD:
			get_tree().change_scene_to_file("res://scenes/overworld.tscn")
		Scene.BARN:
			get_tree().change_scene_to_file("res://scenes/barn.tscn")
		Scene.LAB:
			get_tree().change_scene_to_file("res://scenes/lab.tscn")
		Scene.SHOP:
			get_tree().change_scene_to_file("res://scenes/shop.tscn")
