extends Resource
class_name RunData

const START_MONEY = 50
const START_ROUND = 1
const START_DAY = 1
const START_INVENTORY_SIZE = 3
const START_STABLE_SIZE = 8

@export var seed: int
@export var round: int
@export var day: int

@export var money: int
@export var inventory_size: int
@export var inventory: Array[Item]
@export var stable_size: int
@export var stable: Array[Creature]

func _init(p_seed: int):
	seed = p_seed
	round = START_ROUND
	day = START_DAY
	money = START_MONEY
	inventory_size = START_INVENTORY_SIZE
	stable_size = START_STABLE_SIZE
	
