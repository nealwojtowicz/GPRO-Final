#version 450

#ifdef GL_ES
precision highp float;
#endif

layout (location = 0) out vec4 rtFragColor;

uniform sampler2D uTexWall;
uniform sampler2D uTexFloor;
uniform bool uIsWall;

in vec2 vTexcoord;
in vec4 vPos;
in vec4 vColor;
in vec4 vNormal;
in vec4 vLight;
in float vIntensity;
in vec4 aPosition;

void main()
{
	vec4 col;
	vec4 phongModel;
	
	if(uIsWall)
	{
		col = texture(uTexWall, vTexcoord);
	}
	else
	{
		col = texture(uTexFloor, vTexcoord);
	}

	vec4 N = normalize(vNormal);
	vec4 L = normalize(vLight - vPos);
	float diffCoe = max(0.0, dot(N, L));
	float dist = distance(vLight, vPos);
	float atten = 1.0 / (1.0 + dist/vIntensity + (dist * dist)/(vIntensity * vIntensity));
	float diffInt = diffCoe * atten;
	phongModel = col * vec4(1.0) * diffInt;

	rtFragColor = phongModel;
}