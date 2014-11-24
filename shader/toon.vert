uniform vec3 uLightDir;
varying vec3 vNormal;
varying vec3 vLightDir;

void main(void) {
  // vNormal = normalize(normal*normalMatrix);
  // vLightDir = normalize(cameraPosition * uLightDir);
  // vLightDir = normalize(cameraPosition * uLightDir);
  // vLightDir = normalize(uLightDir * normalMatrix);
  // vLightDir = normalize(normalMatrix * uLightDir);
  // vLightDir = normalize(viewMatrix * -uLightDir);
  // vLightDir = (normalMatrix * uLightDir);
  // vLightDir = uLightDir;
  // vec4 mvPosition = modelViewMatrix * vec4( position, 1.0 );
  // gl_Position = projectionMatrix * mvPosition;
  
  vNormal = normalize(normalMatrix * normal);
  vLightDir = normalize(viewMatrix * vec4(-uLightDir, 1.0)).xyz;
  gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}