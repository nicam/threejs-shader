uniform vec3 lightPosition;
uniform vec3 tangent;

varying vec2 vUv;
varying vec3 toLight;
varying vec3 toCamera;

void main(void)
{
    vec3 binormal = cross(normal, tangent);
    mat3 tbn = mat3(
        vec3(tangent.x, tangent.y, tangent.z),
        vec3(binormal.x, binormal.y, binormal.z),
        vec3(normal.x, normal.y, normal.z)
    );

    toLight = lightPosition - (modelMatrix * vec4(position, 1.0)).xyz;
    toLight = normalize(tbn * toLight);

    toCamera = cameraPosition - (modelMatrix * vec4(position, 1.0)).xyz;
    toCamera = normalize(tbn * toCamera);

    vUv = uv;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}