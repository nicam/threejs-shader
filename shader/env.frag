varying vec3 reflectedDirection;
varying float lambert;
uniform float mixValue;
uniform samplerCube textureCam;
uniform vec3 diffuseColor;

void main(void)
{
  vec3 baseColor = textureCube(textureCam, reflectedDirection).rgb;

  vec3 diffuse = diffuseColor * lambert;

  gl_FragColor = vec4(mix(baseColor, diffuse, mixValue), 1.0);
  //gl_FragColor = vec4(0.0,0.0,0.0,1.0);
}