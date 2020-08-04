class Particle {
 NoiseLoop xNoise, yNoise;
 OpenSimplexNoise openNoise;
 float xoff, yoff;
 NoiseLoop dNoise, rNoise, bNoise;
 
 Particle(OpenSimplexNoise openNoise) {
   this.openNoise = openNoise;
   this.xoff = random(1000000);
   this.yoff = random(1000000);
   this.xNoise = new NoiseLoop(0.3, -width/2, 1.5*width, this.openNoise);
   this.yNoise = new NoiseLoop(0.3, -height/2, 1.5*height, this.openNoise); 
   this.dNoise = new NoiseLoop(1, 5, 40, this.openNoise);
   this.rNoise = new NoiseLoop(5, 100, 255, this.openNoise);
   this.bNoise = new NoiseLoop(5, 100, 255, this.openNoise);
   
 }
 
 void render(float a) {
  noStroke();
  float x = xNoise.value(a);
  float y = yNoise.value(a);
  float d = dNoise.value(a);
  float r = rNoise.value(a);
  float b = bNoise.value(a);
  fill(r,50,b, 200);
  circle(x, y, d); 
 }
}
