int totalFrames = 120;
int counter = 0;
boolean recording  = true;


void setup() {
  size(400, 400);
  
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
  //ellipse(percent*width, height/2, 20, 20);
  
  float angle = percent * TWO_PI;
  translate(width/2, height/2);
  rectMode(CENTER);
  noFill();
  strokeWeight(2);
  stroke(255);
  rotate(angle);
  square(0,0,100);
  
}
