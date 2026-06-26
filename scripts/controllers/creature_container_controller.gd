extends Node2D

@onready var frame: AnimatedSprite2D = $Frame
@onready var creatureController: CreatureController = $Creature

signal container_clicked(creature: Creature)

var prev_creature: Creature

# Called when the node enters the scene tree for the first time.
func _ready():
	frame.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hitbox_mouse_entered():
	frame.play("hover")


func _on_hitbox_mouse_exited():
	frame.play("default")


func _on_hitbox_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if prev_creature == null:
			var creature: Creature = creatureController.get_creature()
			creatureController.set_creature(null)
			container_clicked.emit(creature)
			prev_creature = creature
		else:
			creatureController.set_creature(prev_creature)
			prev_creature = null
