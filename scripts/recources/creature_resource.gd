extends Resource
class_name Creature

@export var name: String
var dna: Array[Vector2i]
var dna_size = 7
var age: int = 0

func _init(p_name: String = "", p_dna: Array[Vector2i] = []):
	name = p_name
	dna = p_dna
	if dna == null or dna.is_empty():
		for i in dna_size:
			dna.push_front(Vector2i(0,0))
