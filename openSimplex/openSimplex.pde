float increment = 0.02 ;
float zoff = 0;
OpenSimplexNoise noise;

void setup() {
  size(640,360);
  noise = new OpenSimplexNoise();
  
}

void draw() {
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
      float n = (float) noise.eval(xoff,yoff, zoff);
      // Try using this line instead
      //float n = random(0,1);
      
      //float bright = map(n, 0, 1, 0, 255);
      //float bright = map(n, -1, 1, 0, 255);
      float bright = n > 0 ? 255 : 0;
      // Set each pixel onscreen to a grayscale value
      pixels[x+y*width] = color(bright);
    }
  }
  
  updatePixels();
  
  zoff+=0.03;
}
