extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in Constants.START_STABLE_SIZE:
		var creatureContainer = Constants.CREATURE_CONTAINER_SCENE.instantiate()
		creatureContainer.set_id(i)
		creatureContainer.position = Vector2i(2000 * i, 0) # TODO take out hardcoding
		add_child(creatureContainer)
		creatureContainer.container_clicked.connect(container_clicked)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func container_clicked(creature: Creature, index: int):
	pass
	
