uniform sampler2D colorMap;
uniform sampler2D normalMap;
uniform vec3 ambientColor;
uniform vec3 diffuseColor;
uniform vec3 spectColor;
uniform float shininess;

varying vec2 vUv;
varying vec3 toLight;
varying vec3 toCamera;

void main(void)
{
    // Farbe aus texture lesen
    vec3 baseColor = texture2D(colorMap, vUv).rgb;
    //Lesen Sie nun die Normale aus der Normal Map mit den aktuellen Texturkoordinaten
    vec3 norm = texture2D(normalMap, vUv).rgb;
    // Skalieren Sie also das Resultat mit dem Faktor 2 und subtrahieren Sie davon 1
    norm = 2.0*norm-1.0;

    vec3 halfVector = normalize(toLight + toCamera);
    float lambert = max(0.0, dot(norm, toLight));
    float phong = max(0.0, dot(norm, halfVector));
    float specularPower = pow(phong, shininess);

    vec3 diffuse = diffuseColor * lambert;
    vec3 specular = spectColor * specularPower;

    vec3 color = ambientColor * baseColor + diffuse * baseColor + specular;
    gl_FragColor = vec4(color, 1.0);
}