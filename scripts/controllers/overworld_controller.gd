extends Node2D

enum Room {
	BARN, LAB, SHOP
}

# Called when the node enters the scene tree for the first time.
func _ready():
	close_room()
	populate_rooms()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func populate_rooms():
	$Room/Barn.populate()
	$Room/Lab.populate()
	$Room/Shop.populate()

func open_room(room: Room):
	$Room.visible = true
	match room:
		Room.BARN:
			$Room/Barn.visible = true
		Room.LAB:
			$Room/Lab.visible = true
		Room.SHOP:
			$Room/Shop.visible = true

func close_room():
	$Room.visible = false
	$Room/Barn.visible = false
	$Room/Lab.visible = false
	$Room/Shop.visible = false

func _on_barn_btn_pressed():
	SceneManager.change_scene(SceneManager.Scene.BARN)


func _on_lab_btn_pressed():
	SceneManager.change_scene(SceneManager.Scene.LAB)


func _on_shop_btn_pressed():
	SceneManager.change_scene(SceneManager.Scene.SHOP)


func _on_back_btn_pressed():
	close_room()
