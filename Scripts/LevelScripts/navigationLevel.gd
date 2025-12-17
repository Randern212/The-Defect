class_name navigationLevel
extends NavigationRegion3D

var detectors:Array[PlayerDetector]
var enemies:Array[FlyingEnemy]
var deadEnemyCount:int=0
var enemyCount:int=0

@onready var defect: Defect = $Defect

func _ready() -> void:
	for child in get_children():
		if child is PlayerDetector:
			detectors.push_back(child)
		elif child is FlyingEnemy:
			child.died.connect(incrementEnemyDeaths)
			enemyCount+=1
			enemies.push_back(child)
	for detector in detectors:
		for enemy in enemies:
			if detector.ID==enemy.ID:
				detector.playerDetected.connect(enemy.setTarget)

func incrementEnemyDeaths()->void:
	deadEnemyCount+=1
	if deadEnemyCount>=enemyCount:
		defect.levelWon()
