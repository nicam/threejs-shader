uniform vec4 uAmbient;
uniform vec4 uDiffuse;
uniform vec4 uSpecular;
uniform float shininess;

varying vec3 vNormal;
varying vec3 vLightDir;
varying vec3 vPos;

void main(void) {
  // Im Viewspace ist der Ursprung die Kamera, deshalb ist die position des Fragments umgekehrt = der Vektor zur Kamera
  vec3 Eye = normalize(-vPos);

  // Same as: normalize( 2.0 * dot(vNormal, vLightDir) * vNormal - vLightDir);
  vec3 Reflected = normalize(reflect(-vLightDir, vNormal));

  // Spekulares Licht nur anzeigen wenn Strahl eintritt, nicht wenn er austritt => Skalarprodukt > 0
  vec4 ISpecular = uSpecular * pow(max(dot(Reflected, Eye), 0.0), shininess);

  // Difuses licht nur anzeigen wenn Strahl eintritt, nicht wenn er austritt => Skalarprodukt > 0
  vec4 IDiffuse = uDiffuse * max(dot(vLightDir, vNormal), 0.0);
  gl_FragColor = ISpecular + IDiffuse + uAmbient;
}