extends Node

# 是否正在显示ui
var ui = false

#是否正在切换场景
var switch = false

func SwitchUIStatus(e:bool):
	ui = e
	if e:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func CanController():
	return !ui && !switch
