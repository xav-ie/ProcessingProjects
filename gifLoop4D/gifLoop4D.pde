int totalFrames = 340;
int counter = 0;
boolean recording  = true;

float increment = 0.010;

OpenSimplexNoise noise;

void setup() {
  size(615, 1250);
  noise = new OpenSimplexNoise();
  colorMode(HSB,100);
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
  float angle = map(percent, 0, 1, 0, TWO_PI);
  float uoff = map(cos(angle), -1, 1, 0, 5);
  float voff = map(sin(angle), -1, 1, 0, 5);
  background(0);
  
  // Optional: adjust noise detail here
  // noiseDetail(8,0.65f);
  
  loadPixels();

  float xoff = 0.0; // Start xoff at 0
  
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < height; y++) {
      yoff += increment; // Increment yoff
      //float n = noise(xoff,yoff, zoff);
      float n = (float) noise.eval(xoff,yoff, uoff, voff);
      // Try using this line instead
      //float n = random(0,1);
      
      //float bright = map(n, 0, 1, 0, 255);
      //float bright = map(n, -1, 1, 0, 255);
      //float bright = (n > 0) ? 255 : 0;
      //float r = (n > 0) ? 225 : 50;
      //float g = 10;
      //float b = (n > 0) ? 120 : 255;
      float bright = map(n, 0, 1, 60, 110) % 100;
      // Set each pixel onscreen to a grayscale value
     
      
      pixels[x+y*width] = color(bright, 50, 250);
    }
  }
  
  updatePixels();
  
  
  
}
