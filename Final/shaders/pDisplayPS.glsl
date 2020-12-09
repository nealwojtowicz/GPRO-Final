#version 450

#ifdef GL_ES
precision highp float;
#endif

layout (location = 0) out vec4 rtFragColor;

in vec2 vTexcoord;

uniform sampler2D uTex;

void main()
{
	vec4 col = texture(uTex, vTexcoord);
	rtFragColor = col;
}