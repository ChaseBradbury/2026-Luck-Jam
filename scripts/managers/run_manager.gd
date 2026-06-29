extends Node

var RNG: RandomNumberGenerator
var runData: RunData

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	RNG = RandomNumberGenerator.new()
	runData = RunData.new(RNG.get_seed())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
