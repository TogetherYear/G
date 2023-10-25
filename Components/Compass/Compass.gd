extends Control

signal Select()

@onready var animationTree = $AnimationTree

@onready var center = Vector2($Select.size.x/2,$Select.size.x/2)

@onready var outDistance = ($Select.size.x/2) * ($Select.size.x/2)

@onready var inDistance = ($Select/Whole/Mid.get_rect().size.x/2 + 5) * ($Select/Whole/Mid.get_rect().size.x/2 + 5)

enum Current {
	Empty = -1,
	Mid,
	Single1,
	Single2,
	Single3,
	Single4,
	Single5,
	Single6,
}

func GetCompassPart(p:Vector2):
	if p.distance_squared_to(center) < outDistance:
			if p.distance_squared_to(center) < inDistance:
				return Current.Mid
			else:
				var part = (int)(TExtensionMethon.GetAnlgeFromPoint(p,center)/60)
				match part:
					0: return Current.Single3
					1: return Current.Single2
					2: return Current.Single1
					3: return Current.Single6
					4: return Current.Single5
					5: return Current.Single4
	else:
		return Current.Empty

func OnSelectGuiInput(event:InputEvent):
	if event is InputEventMouseMotion:
		animationTree.set("parameters/Select/blend_position",GetCompassPart(event.position))
	
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			var part = GetCompassPart(event.position)
			if part != Current.Empty:
				Select.emit(part)
