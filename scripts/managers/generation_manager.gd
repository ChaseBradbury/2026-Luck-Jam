extends Node


static func create_creature() -> Creature:
	var new_dna: Array[Vector2i]
	var featureTypes = Constants.FEATURES.FeatureTypes
	for geneIndex in featureTypes.size():
		var geneSize: int
		match geneIndex:
			Constants.FEATURES.FeatureTypes.EAR:
				geneSize = Constants.FEATURES.ears.array.size()
			Constants.FEATURES.FeatureTypes.HEAD:
				geneSize = Constants.FEATURES.heads.array.size()
			Constants.FEATURES.FeatureTypes.EYE:
				geneSize = Constants.FEATURES.eyes.array.size()
			Constants.FEATURES.FeatureTypes.EYEBROW:
				geneSize = Constants.FEATURES.eyebrows.array.size()
			Constants.FEATURES.FeatureTypes.MOUTH:
				geneSize = Constants.FEATURES.mouths.array.size()
			Constants.FEATURES.FeatureTypes.NOSE:
				geneSize = Constants.FEATURES.noses.array.size()
			Constants.FEATURES.FeatureTypes.HAIR:
				geneSize = Constants.FEATURES.hairs.array.size()
		var gene: Vector2i
		gene.x = RunManager.RNG.randi_range(0, geneSize-1)
		gene.y = RunManager.RNG.randi_range(0, geneSize-1)
		new_dna.push_back(gene)
	return Creature.new("name!", new_dna)
