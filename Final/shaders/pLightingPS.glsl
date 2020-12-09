#version 450

#ifdef GL_ES
precision highp float;
#endif

layout (location = 0) out vec4 rtFragColor;

uniform sampler2D uTexWall;
uniform sampler2D uTexFloor;
uniform vec2 uResolution;
uniform bool uIsWall;

in vec2 vTexcoord;
in vec4 vPos;

void main()
{
	vec4 col;
	
	rtFragColor = col;
}