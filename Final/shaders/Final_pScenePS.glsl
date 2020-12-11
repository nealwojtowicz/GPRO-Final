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
	float dist = dot(vLight, vPos);
	float atten = 1.0 / (1.0 + dist/vIntensity + (dist * dist)/(vIntensity * vIntensity));
	float diffInt = diffCoe * atten;
	vec3 H1 = normalize(L.xyz * L.xyz);
	float spec = max(0.0, dot(N.xyz, H1));
	phongModel = vec4(0.0) + diffInt * N * vColor + pow(spec, 64.0) * vec4(1.0);
	
	/*
	vec4 view = normalize(vPos - aPosition);
	vec4 light = normalize(vLight - aPosition);
	vec4 normal = normalize(vNormal);
	vec4 reflection = reflect(-light, normal);
	
	float diffcoe = max(0.0, dot(light, normal));
	float dist = distance(vLight, aPosition);
	float atten = 1.0 / (1.0 + dist/vIntensity + (dist * dist)/(vIntensity * vIntensity));
	
	vec4 spec = pow(max(0.0, dot(view, reflection)), 64.0) * vec4(1.0);
	
	phongModel = (vec4(0.0) + ((diffcoe + spec) * atten)) * normal * vColor; */
	
	rtFragColor = phongModel * col;
}