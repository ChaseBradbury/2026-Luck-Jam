extends Node2D
class_name CreatureController

@export var featureMasterList: FeatureMasterList

@export var creature: Creature

# Called when the node enters the scene tree for the first time.
func _ready():
	update_visuals()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_visuals():
	if creature == null:
		$Ears.texture = Constants.TRANSPARENT_ICON
		$Head.texture = Constants.TRANSPARENT_ICON
		$Eyes.texture = Constants.TRANSPARENT_ICON
		$Eyebrows.texture = Constants.TRANSPARENT_ICON
		$Mouth.texture = Constants.TRANSPARENT_ICON
		$Nose.texture = Constants.TRANSPARENT_ICON
		$Hair.texture = Constants.TRANSPARENT_ICON
	else:
		for geneIndex in creature.dna.size():
			var alleleIndex = creature.dna[geneIndex].x
			match geneIndex:
				featureMasterList.FeatureTypes.EAR:
					$Ears.texture = featureMasterList.ears.array[alleleIndex].texture
				featureMasterList.FeatureTypes.HEAD:
					$Head.texture = featureMasterList.heads.array[alleleIndex].texture
				featureMasterList.FeatureTypes.EYE:
					$Eyes.texture = featureMasterList.eyes.array[alleleIndex].texture
				featureMasterList.FeatureTypes.EYEBROW:
					$Eyebrows.texture = featureMasterList.eyebrows.array[alleleIndex].texture
				featureMasterList.FeatureTypes.MOUTH:
					$Mouth.texture = featureMasterList.mouths.array[alleleIndex].texture
				featureMasterList.FeatureTypes.NOSE:
					$Nose.texture = featureMasterList.noses.array[alleleIndex].texture
				featureMasterList.FeatureTypes.HAIR:
					$Hair.texture = featureMasterList.hairs.array[alleleIndex].texture

func set_creature(new_creature: Creature):
	creature = new_creature
	update_visuals()

func get_creature() -> Creature:
	return creature
