class NoiseLoop {
  float diameter, min, max;
  OpenSimplexNoise openNoise;
  float cx, cy;
  
  NoiseLoop(float d, float min, float max, OpenSimplexNoise openNoise) {
       this.diameter = d;
       this.min = min;
       this.max = max;
       this.openNoise = openNoise;
       this.cx = random(1000);
       this.cy = random(1000);
  }
 
  float value(float a) {
    float noiseMax = 5;
    float xoff = map(cos(a), -1, 1, cx, cx+this.diameter);
    float yoff = map(sin(a), -1, 1, cy, cy+this.diameter);
    float r = (float) this.openNoise.eval(xoff, yoff);
    //r = noise(xoff, yoff);
    float x = map(r, -1, 1, min, max);
    //x = map(r, 0, 1, min, max);
    return x;
  }
 
 
}
