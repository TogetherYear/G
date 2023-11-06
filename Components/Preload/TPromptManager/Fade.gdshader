shader_type canvas_item;

uniform float leftSpe = 0.48;
uniform float rightSpe = 0.52;
uniform float power = 2.0;
uniform float wholeAlphaScale = 0.4;
uniform vec4 fadeColor:source_color = vec4(0.0,0.0,0.0,1.0);

void fragment()
{
	float result = fadeColor.a;
	if(UV.x<leftSpe)
	{
		result = pow(mix(0.0,fadeColor.a,UV.x * (1.0 / leftSpe)),power);
	}
	else if(UV.x>rightSpe)
	{
		result = pow(mix(0.0,fadeColor.a,(1.0 - UV.x) * (1.0 / leftSpe)),power);
	}
	else
	{
		result = pow(fadeColor.a,power);
	}
	COLOR = vec4(fadeColor.r,fadeColor.g,fadeColor.b,result*wholeAlphaScale);
}
