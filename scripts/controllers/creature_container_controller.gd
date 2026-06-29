extends Node2D
class_name CreatureContainerController

@onready var frame: AnimatedSprite2D = $Frame
@onready var creatureController: CreatureController = $Creature

@export var id: int

signal container_clicked(creature: Creature, containerIndex: int)

var prev_creature: Creature

# Called when the node enters the scene tree for the first time.
func _ready():
	pass #frame.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_id(i: int = 0):
	id = i

func get_creature() -> Creature:
	return creatureController.get_creature()

func set_creature(creature: Creature):
	creatureController.set_creature(creature)
 
func _on_hitbox_mouse_entered():
	frame.play("hover")


func _on_hitbox_mouse_exited():
	frame.play("default")


func _on_hitbox_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		container_clicked.emit(creatureController.get_creature(), id)

func handle_drag_and_drop(creature: Creature):
	if creature == null:
		pass#creature = get_
	if prev_creature == null:
		#var creature: Creature = creatureController.get_creature()
		creatureController.set_creature(null)
		prev_creature = creature
	else:
		creatureController.set_creature(prev_creature)
		prev_creature = null
