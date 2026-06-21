extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func randomize_creature(creature: Creature):
	for geneIndex in creature.dna.size():
		# TODO: change range to reflect actual array size
		creature.dna[geneIndex].x = randi_range(0,4)
		creature.dna[geneIndex].y = randi_range(0,4)

func _on_randomize_pressed():
	var creature = $ParentCreature.get_creature()
	randomize_creature(creature)
	$ParentCreature.set_creature(creature)


func _on_randomize_2_pressed():
	var creature = $ParentCreature2.get_creature()
	randomize_creature(creature)
	$ParentCreature2.set_creature(creature)


func _on_breed_pressed():
	var parent1 = $ParentCreature.get_creature()
	var parent2 = $ParentCreature2.get_creature()
	var child = $ChildCreature.get_creature()
	for geneIndex in child.dna.size():
		if randi() % 2:
			child.dna[geneIndex].x = parent1.dna[geneIndex].x
		else:
			child.dna[geneIndex].x = parent2.dna[geneIndex].x
	$ChildCreature.set_creature(child)
