extends Control

@onready var progressBar = $ProgressBar

@onready var animationPlayer = $SceneAnimationPlayer

@onready var label = $Wait/Label

@onready var waitPlayer = $Wait/WaitPlayer

var path:String

var progress = []

var loadStatus = 0

var loaded = false

func _ready():
	hide()
	set_process(false)

func ShowBody():
	TStatus.switch = true
	loaded = false
	show()
	waitPlayer.play("Hide")
	progressBar.value = 0
	animationPlayer.play("Show")
	await animationPlayer.animation_finished
	set_process(true)

func HideBody():
	loaded = false
	set_process(false)
	animationPlayer.play("Hide")
	await animationPlayer.animation_finished
	hide()
	TStatus.switch = false

func SwitchScene(e:String):
	path = e
	ShowBody()
	ResourceLoader.load_threaded_request(path)

func OnLoad():
	animationPlayer.play("ProgressbarHide")
	await animationPlayer.animation_finished
	waitPlayer.play("Flash")
	loaded = true

func _process(_delta):
	loadStatus = ResourceLoader.load_threaded_get_status(path,progress)
	if loadStatus !=ResourceLoader.THREAD_LOAD_INVALID_RESOURCE:
		progressBar.value = progress[0] * 100
		if loadStatus == ResourceLoader.THREAD_LOAD_LOADED:
			get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(path))
			await get_tree().create_timer(1).timeout
			OnLoad()
	
	if loaded:
		if Input.is_action_just_pressed("Skip"):
			HideBody()
