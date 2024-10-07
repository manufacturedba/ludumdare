extends Node

var _currentLevel := 1;

func completeLevel() -> void:
	_currentLevel += 1;

func checkLevelDisabled(level: int) -> bool:
	return level > _currentLevel;
