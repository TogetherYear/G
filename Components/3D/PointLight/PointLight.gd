extends OmniLight3D

@export var lineColor:Gradient

@export var speed = 0.2
var time = 0

func _process(delta):
	if time > 1:
		time = 0
	else :
		time += speed * delta
	light_color = lineColor.sample(time)
