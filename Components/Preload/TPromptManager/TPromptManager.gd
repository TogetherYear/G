extends Control

@onready var animationPlayer = $AnimationPlayer;

@onready var label = $Back/Message/Text;

func _ready():
	animationPlayer.play("Reset");

func Message(e:String):
	animationPlayer.stop();
	label.text = e;
	animationPlayer.play("Popup");
	
