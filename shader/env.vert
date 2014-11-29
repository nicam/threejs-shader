uniform vec3 lightPosition;
varying vec3 reflectedDirection;
varying float lambert;

void main(void)
{
  //TODO: is this the right way to transform world position?
  // Normalize
  // vec3 worldPosition = normalize(modelMatrix * vec4(position, 1.0)).xyz;
  // vec3 viewNormal = normalize(normalMatrix * normal);
  vec3 worldNormal = normalize(modelMatrix * vec4(normal, 0.0)).xyz;

  // vec3 worldPosition = normalize(modelMatrix * position);
  // Transform position into worldSpace
  vec3 worldPosition = normalize(modelMatrix * vec4(position, 1.0)).xyz;

  // Calculate view direction
  vec3 worldViewDirection = normalize(worldPosition - cameraPosition);
  // transform to viewspace
  // vec3 viewViewDirection = normalize(viewMatrix * vec4(viewDirection, 0.0)).xyz;

  // 0.0 for vectors
  // 1.0 for positions


  //TODO: it seems that reflectiondirection with normal in world space thers really weird
  reflectedDirection = normalize(reflect(worldViewDirection, worldNormal));

  lambert = max(0.0, dot(normal, lightPosition));

  gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}