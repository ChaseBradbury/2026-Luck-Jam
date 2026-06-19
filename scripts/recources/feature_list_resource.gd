extends Resource
class_name FeatureList

@export var array: Array[Feature]

func get_feature(i: int) -> Feature:
	return array[i]
