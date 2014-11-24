uniform vec3 lightPosition;
varying vec3 reflectedDirection;
varying float lambert;

void main(void)
{
  //TODO: is this the right way to transform world position?
  // Normalize
  vec3 worldPosition = normalize(modelMatrix * vec4(position, 1.0)).xyz;
  // vec3 worldPosition = normalize(modelMatrix * position);
  vec3 worldSpaceNormal = normalize(normalMatrix * normal);

  vec3 viewDirection = normalize(worldPosition - cameraPosition);
  // reflect

  //TODO: it seems that reflectiondirection with normal in world space thers really weird
  reflectedDirection = reflect(viewDirection, normal);

  lambert = max(0.0, dot(normal, lightPosition));

  gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}