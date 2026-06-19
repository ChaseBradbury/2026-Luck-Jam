extends Resource
class_name Creature

@export var name: String
var dna: Array[Vector2i]
var dna_length: int = 7

func _init(p_name: String = ""):
	name = p_name
	dna = []
	for i in dna_length:
		dna.push_front(Vector2i(0,0))
	
