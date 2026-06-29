extends Node2D
class_name CreatureController

@export var creature: Creature = null

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
				Constants.FEATURES.FeatureTypes.EAR:
					$Ears.texture = Constants.FEATURES.ears.array[alleleIndex].texture
				Constants.FEATURES.FeatureTypes.HEAD:
					$Head.texture = Constants.FEATURES.heads.array[alleleIndex].texture
				Constants.FEATURES.FeatureTypes.EYE:
					$Eyes.texture = Constants.FEATURES.eyes.array[alleleIndex].texture
				Constants.FEATURES.FeatureTypes.EYEBROW:
					$Eyebrows.texture = Constants.FEATURES.eyebrows.array[alleleIndex].texture
				Constants.FEATURES.FeatureTypes.MOUTH:
					$Mouth.texture = Constants.FEATURES.mouths.array[alleleIndex].texture
				Constants.FEATURES.FeatureTypes.NOSE:
					$Nose.texture = Constants.FEATURES.noses.array[alleleIndex].texture
				Constants.FEATURES.FeatureTypes.HAIR:
					$Hair.texture = Constants.FEATURES.hairs.array[alleleIndex].texture

func set_creature(new_creature: Creature):
	creature = new_creature
	update_visuals()

func get_creature() -> Creature:
	return creature
