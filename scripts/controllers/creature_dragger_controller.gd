extends Node2D

@onready var creatureController: CreatureController = $Creature

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = get_global_mouse_position()

func set_creature(creature: Creature):
	creatureController.set_creature(creature)

func get_creature() -> Creature:
	return creatureController.get_creature()
