uniform sampler2D colorMap;
uniform sampler2D normalMap;
uniform sampler2D heightMap;
uniform vec3 ambientColor;
uniform vec3 diffuseColor;
uniform vec3 spectColor;
uniform float shininess;
uniform float scale;
uniform float bias;

varying vec2 vUv;
varying vec3 toLight;
varying vec3 toCamera;

void main(void)
{
    float height = texture2D(heightMap, vUv).rgb.x;
    float hsb = height * scale + bias;
    vec2 eyeVector = vec2(toCamera.x, toCamera.y);
    vec2 newCoord = vUv + hsb * eyeVector;

    vec3 textColor = texture2D(colorMap, newCoord).rgb;
    vec3 norm = texture2D(normalMap, newCoord).rgb;
    norm = 2.0*norm-1.0;

    vec3 halfVector = normalize(toLight + toCamera);
    float lambert = max(0.0, dot(norm, toLight));
    float phong = max(0.0, dot(norm, halfVector));
    float specularPower = pow(phong, shininess);

    vec3 diffuse = diffuseColor*lambert;
    vec3 specular = spectColor*specularPower;

    vec3 color = ambientColor*textColor + diffuse*textColor+specular;
    gl_FragColor = vec4(color, 1.0);
}