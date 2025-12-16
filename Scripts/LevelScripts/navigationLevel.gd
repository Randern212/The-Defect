class_name navigationLevel
extends NavigationRegion3D

var detectors:Array[PlayerDetector]
var enemies:Array[FlyingEnemy]

func _ready() -> void:
	for child in get_children():
		if child is PlayerDetector:
			detectors.push_back(child)
		elif child is FlyingEnemy:
			enemies.push_back(child)
	for detector in detectors:
		for enemy in enemies:
			if detector.ID==enemy.ID:
				detector.playerDetected.connect(enemy.setTarget)
