#version 450

layout (location = 0) in vec4 aPos;
layout (location = 1) in vec3 aNormal;

uniform mat4 uModelMatrix, uViewMatrix, uProjMatrix;

out vec4 aPosition;
out vec4 vPos;
out vec4 vColor;
out vec4 vNormal;
out vec4 vLight;
out float vIntensity;

void main()
{
	mat4 modelViewProjMatrix = uProjMatrix * uViewMatrix * uModelMatrix;
	mat4 modelViewMatrix = uViewMatrix * uModelMatrix;
	vPos = modelViewProjMatrix * aPos;
	gl_Position = vPos;
	vec4 lightPos = vec4(1.0, 1.0, -1.0, 1.0);
	mat3 normalMat = inverse(transpose(mat3(modelViewMatrix)));
	vec3 nrm = normalMat * aNormal;
	
	vNormal = vec4(nrm, 0.0);
	vIntensity = 1000.0;
	vLight = lightPos;
	vColor = vec4(1.0);
	aPosition = uModelMatrix * aPos;
}