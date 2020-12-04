#version 450

layout (location = 0) in vec4 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoord;

uniform mat4 uModelMatrix, uViewMatrix, uProjMatrix;
uniform vec2 uScale;

out vec2 vTexcoord;
out vec4 vPos;
out vec4 vColor;
out vec4 vNormal;
out vec4 vLight;
out float vIntensity;

void main()
{
	mat4 modelViewProjMatrix = uProjMatrix * uViewMatrix * uModelMatrix;
	vPos = modelViewProjMatrix * aPos;
	gl_Position = vPos;
	vTexcoord = aTexCoord * uScale;
}