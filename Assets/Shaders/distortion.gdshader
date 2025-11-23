shader_type canvas_item;

uniform sampler2D screenTexture:hint_screen_texture,filter_linear_mipmap;
uniform float amplitude=0.01;
uniform float frequency=5.0;
void fragment()
{
	vec2 newUV=SCREEN_UV;
	newUV.x+=sin(newUV.y*frequency+TIME)*amplitude;
	vec3 distortedColor=textureLod(screenTexture,newUV,0.0).rgb;
	COLOR.rgb=distortedColor;
}