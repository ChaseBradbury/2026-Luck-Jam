extends Node2D

var runData: RunData

@onready var parent1Node = $Breeding/ParentCreature
@onready var parent2Node = $Breeding/ParentCreature2
@onready var childNode = $Breeding/ChildCreature


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func populate(p_runData: RunData):
	runData = p_runData
	
	_on_randomize_pressed()
	_on_randomize_2_pressed()

func randomize_creature(creature: Creature):
	for geneIndex in creature.dna.size():
		# TODO: change range to reflect actual array size
		creature.dna[geneIndex].x = randi_range(0,4)
		creature.dna[geneIndex].y = randi_range(0,4)

func _on_randomize_pressed():
	var creature = parent1Node.get_creature()
	randomize_creature(creature)
	parent1Node.set_creature(creature)


func _on_randomize_2_pressed():
	var creature = parent2Node.get_creature()
	randomize_creature(creature)
	parent2Node.set_creature(creature)


func _on_breed_pressed():
	var parent1 = parent1Node.get_creature()
	var parent2 = parent2Node.get_creature()
	var child = childNode.get_creature()
	for geneIndex in child.dna.size():
		if randi() % 2:
			child.dna[geneIndex].x = parent1.dna[geneIndex].x
		else:
			child.dna[geneIndex].x = parent2.dna[geneIndex].x
	childNode.set_creature(child)
