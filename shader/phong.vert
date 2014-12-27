uniform vec3 uLightDir;
varying vec3 vNormal;
varying vec3 vLightDir;

varying vec3 vPos;

void main(void) {
  // Normale in Viewspace
  vNormal = normalize(normalMatrix * normal);

  // Light Richtung von Worldspace zu Viewspace
  vLightDir = normalize(viewMatrix * vec4(-uLightDir, 0.0)).xyz;

  // Position von Objectspace -> Viewspace
  vPos = vec3((modelViewMatrix * vec4(position, 1.0)).xyz);

  // gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
  gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}