extends Node2D

enum Room {
	BARN, LAB, SHOP
}

var RNG: RandomNumberGenerator

var runData: RunData

# Called when the node enters the scene tree for the first time.
func _ready():
	RNG = RandomNumberGenerator.new()
	runData = RunData.new(RNG.get_seed())
	close_room()
	populate_rooms()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func populate_rooms():
	$Room/Barn.populate(runData)
	$Room/Lab.populate(runData)
	$Room/Shop.populate(runData)

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
	open_room(Room.BARN)


func _on_lab_btn_pressed():
	open_room(Room.LAB)


func _on_shop_btn_pressed():
	open_room(Room.SHOP)


func _on_back_btn_pressed():
	close_room()
