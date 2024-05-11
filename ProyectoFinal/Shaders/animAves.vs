#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

const float amplitude = 2.0;
const float frequency = 0.5;
const float PI = 3.14159;
out vec2 TexCoords;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform float time;

void main()
{
    float distance = length(aPos);
    float angle = time * frequency;
    float effect = amplitude * sin(angle);

    //modificamos la posición en x y z para que las aves vuelen en círculos

    float new_x = aPos.x * cos(angle) + aPos.z * sin(angle);
    float new_z = aPos.x * sin(angle) - aPos.z * cos(angle);

    gl_Position = projection * view * model * vec4(new_x + effect, aPos.y, new_z, 1.0);
    TexCoords = vec2(aTexCoords.x + effect * 0.1, aTexCoords.y);
}
