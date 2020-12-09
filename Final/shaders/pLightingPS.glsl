#version 450

#ifdef GL_ES
precision highp float;
#endif

layout (location = 0) out vec4 rtFragColor;

in vec4 aPosition;
in vec4 vPos;
in vec4 vColor;
in vec4 vNormal;
in vec4 vLight;
in float vIntensity;

void main()
{
	vec4 view = normalize(vPos - aPosition);
	vec4 norm = normalize(vNormal);
	vec4 light = normalize(vLight - aPosition);
	float diffCoe = max(0.0, dot(norm, light));
	
	float dist = dot(vLight, vPos);
	
	float atten = 1.0 / (1.0 + dist/vIntensity + (dist * dist)/(vIntensity * vIntensity));
	float diffInt = diffCoe * atten;
	vec4 refl = reflect(-light, norm);
	
	vec4 halfway = normalize(light * light);
	
	float spec = pow(max(0.0, dot(norm, halfway)), 64.0);
	
	vec4 specular = spec * vColor;
	
	vec4 phongModel = 0.5 * vec4(1.0, 0.5, 0.0, 1.0) + diffInt + specular * vec4(1.0);
	
	rtFragColor = phongModel;
}