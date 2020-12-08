#version 450

layout (location = 0) in vec4 aPos;
layout (location = 2) in vec2 aTexCoord;

uniform mat4 uModelMatrix, uViewMatrix, uProjMatrix;
uniform vec2 uScale;

out vec2 vTexcoord;
out vec4 vPos;

void main()
{
	mat4 modelViewProjMatrix = uProjMatrix * uViewMatrix * uModelMatrix;
	vPos = modelViewProjMatrix * aPos;
	gl_Position = vPos;
	vTexcoord = aTexCoord * uScale;
}