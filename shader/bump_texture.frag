uniform sampler2D colorMap;

varying vec2 vUv;

void main(void)
{
  vec3 color = texture2D(colorMap, vUv).rgb;
  gl_FragColor = vec4(color, 1.0);
}