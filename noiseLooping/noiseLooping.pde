int totalFrames= 240;
int counter = 0;
boolean recording = true;

float a = 0;
OpenSimplexNoise openNoise;

Particle[] particles = new Particle[50];

void setup() {
 size(200,200);
 openNoise = new OpenSimplexNoise();
 for(int i=0; i<particles.length; i++) {
    particles[i] = new Particle(openNoise); 
 }
 
}
void draw() {
  float percent = 0;
  if (recording) {
    percent = (float(counter) / totalFrames);
  } else {
    percent = (float(counter) / totalFrames) % 1;
  }
  
  render(percent);
  if (recording) {
    if(counter==totalFrames-1) exit();
    saveFrame("output/gif-"+nf(counter,3)+".png");
    println(percent);
    
  }
  counter++;
}




void render(float percent) {
  background(20); 
  float angle = percent * TWO_PI;
  
  for(Particle p : particles) {
    p.render(angle);
  }
  
}
