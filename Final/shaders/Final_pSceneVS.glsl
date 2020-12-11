#version 450

layout (location = 0) in vec4 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoord;

uniform mat4 uModelMatrix, uViewMatrix, uProjMatrix;
uniform vec2 uScale;
uniform vec2 uResolution;

out vec2 vTexcoord;
out vec4 vPos;
out vec4 vColor;
out vec4 vNormal;
out vec4 vLight;
out float vIntensity;
out vec4 aPosition;

void main()
{
	mat4 modelViewProjMatrix = uProjMatrix * uViewMatrix * uModelMatrix;
	mat4 modelViewMatrix = uViewMatrix * uModelMatrix;
	vPos = modelViewProjMatrix * aPos;
	gl_Position = vPos;
	vTexcoord = aTexCoord * uScale;
	
	vec4 lightPos = vec4(0.0, 0.0, 3.0, 2.0);
	mat3 normalMat = inverse(transpose(mat3(modelViewMatrix)));
	vec3 nrm = normalMat * aNormal;
	
	vNormal = vec4(nrm, 0.0);
	vIntensity = 1.0;
	vLight = lightPos;
	vColor = aPos;
	aPosition = aPos;
}