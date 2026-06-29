extends Node2D

@onready var parent1Node = $Breeding/ParentContainer1
@onready var parent2Node = $Breeding/ParentContainer2
@onready var childNode = $Breeding/ChildContainer
@onready var stableNode = $Stable
@onready var draggerNode = $CreatureDragger

var containerControllers: Array[CreatureContainerController]

# Called when the node enters the scene tree for the first time.
func _ready():
	var container_count: int = 0
	for i in Constants.START_STABLE_SIZE:
		var creatureContainer = Constants.CREATURE_CONTAINER_SCENE.instantiate()
		creatureContainer.set_id(container_count)
		creatureContainer.position = Vector2i(2000 * i, 0) # TODO take out hardcoding
		creatureContainer.container_clicked.connect(_on_container_clicked)
		stableNode.add_child(creatureContainer)
		containerControllers.push_back(creatureContainer)
		creatureContainer.set_creature(GenerationManager.create_creature())
		container_count += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func populate():
	
	_on_randomize_pressed()
	_on_randomize_2_pressed()

func _on_container_clicked(creature: Creature, id: int):
	var clickedContainer
	match id:
		parent1Node.id:
			clickedContainer = parent1Node
		parent2Node.id:
			clickedContainer = parent2Node
		childNode.id:
			clickedContainer = childNode
		_:
			clickedContainer = containerControllers[id]
	var dragCreature = draggerNode.get_creature()
	clickedContainer.set_creature(dragCreature)
	draggerNode.set_creature(creature)

func randomize_creature(creature: Creature):
	for geneIndex in creature.dna.size():
		# TODO: change range to reflect actual array size
		creature.dna[geneIndex].x = randi_range(0,4)
		creature.dna[geneIndex].y = randi_range(0,4)

func _on_randomize_pressed():
	var creature = parent1Node.get_creature()
	if creature == null:
		creature = Creature.new()
	randomize_creature(creature)
	parent1Node.set_creature(creature)


func _on_randomize_2_pressed():
	var creature = parent2Node.get_creature()
	if creature == null:
		creature = Creature.new()
	randomize_creature(creature)
	parent2Node.set_creature(creature)


func _on_breed_pressed():
	var parent1 = parent1Node.get_creature()
	var parent2 = parent2Node.get_creature()
	var child = childNode.get_creature()
	if parent1 == null or parent2 == null or child != null:
		return
	child = GenerationManager.create_creature()
	for geneIndex in child.dna.size():
		if randi() % 2:
			child.dna[geneIndex].x = parent1.dna[geneIndex].x
		else:
			child.dna[geneIndex].x = parent2.dna[geneIndex].x
	childNode.set_creature(child)
