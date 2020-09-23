shader_type canvas_item;

uniform int angle;
uniform float width;


void fragment() {
	COLOR = texture(TEXTURE, UV);
	if ((UV.x >= UV.y) || (UV.x < UV.y  - 1.0/width))
	{
		COLOR.a = 0.0;
	}
}

void light() {
	LIGHT = vec4(1.0, 1.0, 1.0, 1.0);
}