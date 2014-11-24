uniform vec3 lightPosition;
uniform vec3 tangent;

varying vec2 vUv;
varying vec3 toLight;
varying vec3 toCamera;

void main(void)
{
    // http://www.txutxi.com/?p=316
    vec3 binormal = cross(normal, tangent);
    // mat3 tbn = mat3(
    //     vec3(tangent.x, binormal.x, normal.x),
    //     vec3(tangent.y, binormal.y, normal.y),
    //     vec3(tangent.z, binormal.z, normal.z)
    // );    
    mat3 tbn = mat3(
        vec3(tangent.x, tangent.y, tangent.z),
        vec3(binormal.x, binormal.y, binormal.z),
        vec3(normal.x, normal.y, normal.z)
    );

    // Richtung zum Licht, position = aktueller Vertex im Objectspace
    toLight = lightPosition - position;
    // transformieren Sie die resultierenden Vektoren in den Tangent
    toLight = normalize(tbn * toLight);

    // Richtung zur Kamera
    toCamera = cameraPosition - position;
    // transformieren Sie die resultierenden Vektoren in den Tangent
    toCamera = normalize(tbn * toCamera);

    // Pass Texture Coordinate
    vUv = uv;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}