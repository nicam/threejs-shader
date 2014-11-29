uniform vec3 lightPosition;
uniform vec3 tangent;

varying vec2 vUv;
varying vec3 toLight;
varying vec3 toCamera;

void main(void)
{
    // http://www.txutxi.com/?p=316
    vec3 binormal = cross(normal, tangent);
    mat3 tbn = mat3(
        vec3(tangent.x, tangent.y, tangent.z),
        vec3(binormal.x, binormal.y, binormal.z),
        vec3(normal.x, normal.y, normal.z)
    );

    // Richtung zum Licht, position = aktueller Vertex im Objectspace, transform to world space
    toLight = lightPosition - (modelMatrix * vec4(position, 1.0)).xyz;
    // transformieren Sie die resultierenden Vektoren in den Tangent Space
    toLight = normalize(tbn * toLight);

    // Richtung zur Kamera
    toCamera = cameraPosition - (modelMatrix * vec4(position, 1.0)).xyz;
    // transformieren Sie die resultierenden Vektoren in den Tangent Space
    toCamera = normalize(tbn * toCamera);

    // Pass Texture Coordinate
    vUv = uv;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}