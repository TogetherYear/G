extends Node

#获取俩个二维向量夹角
func GetAnlgeFromPoint(point:Vector2, origin:Vector2):
	var dir = Vector2(point.x - origin.x, point.y - origin.y).normalized()
	var angle = rad_to_deg(acos(dir.y))
	if point.x > origin.x:
		angle
	else:
		360 - angle
