#version 450

#ifdef GL_ES
precision highp float;
#endif

layout (location = 0) out vec4 rtFragColor;

uniform sampler2D uTex;
uniform vec2 uResolution;

in vec2 vTexcoord;
in vec4 vPos;
in vec4 vColor;
in vec4 vNormal;
in vec4 vLight;
in float vIntensity;

void main()
{
	rtFragColor = vec4(1.0, 0.5, 0.0, 1.0);
}