extends Resource
class_name RunData

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
	round = Constants.START_ROUND
	day = Constants.START_DAY
	money = Constants.START_MONEY
	inventory_size = Constants.START_INVENTORY_SIZE
	stable_size = Constants.START_STABLE_SIZE
	
