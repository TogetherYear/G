extends Node3D

func _ready():
	TStatus.SwitchUIStatus(true)

func OnStartPressed():
	TSceneManager.SwitchScene("res://Levels/Game1/Game1.tscn")


func OnExitPressed():
	get_tree().quit()
