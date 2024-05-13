shader_type canvas_item;

uniform float pixelFactor : hint_range(0,10) = 10;

void fragment(){
	vec2 pixelatedUV = round(UV * pixelFactor) / pixelFactor;
	COLOR = vec4(pixelatedUV.x, pixelatedUV.y, 0 ,1);
}