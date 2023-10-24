extends Control

func _process(_delta):
	if Input.is_action_just_pressed("Esc"):
		if visible:
			OnKeepPressed()
		else:
			show()
			TStatus.SwitchUIStatus(true)
		

func OnKeepPressed():
	hide()
	TStatus.SwitchUIStatus(false)


func OnBackPressed():
	TSceneManager.SwitchScene("res://Levels/Main/Main.tscn")


func OnExitPressed():
	get_tree().quit()
