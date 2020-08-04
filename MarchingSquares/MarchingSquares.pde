float[][] field;
final int resolution = 10;
int cols, rows;
float increment = 0.1;
float zoff = 0;

OpenSimplexNoise noise;

void setup() {
   //size(600,400);
   fullScreen();
   noise = new OpenSimplexNoise();
   cols = 1 + width / resolution;
   rows = 1 + height / resolution;
   field = new float[cols][rows];
   
}

void draw() {
  background(127);
  float xoff=0;
  zoff+=0.05;
  for (int i = 0; i < cols; i++) {
    xoff+=increment;
    float yoff=0;
    for (int j = 0; j < rows; j++) {
       field[i][j] = (float)(noise.eval(xoff, yoff,zoff));
       yoff+=increment;
      }
   }
   
  
  
  
  
  for (int i = 0; i < cols; i++) {
     for (int j = 0; j < rows; j++) {
       stroke(field[i][j]*255);
       strokeWeight(resolution*.4);
       point(i*resolution, j*resolution);
       if(!(i==cols-1 || j==rows-1)) {
       float x = i * resolution;
       float y = j * resolution;
        //PVector a = new PVector(x + rez * 0.5, y            );
        //PVector b = new PVector(x + rez, y + rez * 0.5);
        //PVector c = new PVector(x + rez * 0.5, y + rez      );
        //PVector d = new PVector(x, y + rez * 0.5);
        int state = getState(ceil(field[i][j]), ceil(field[i+1][j]), 
          ceil(field[i+1][j+1]), ceil(field[i][j+1]));
  
        float a_val = field[i][j] + 1;
        float b_val = field[i+1][j] + 1;
        float c_val = field[i+1][j+1] + 1;
        float d_val = field[i][j+1] + 1;      
  
        PVector a = new PVector();
        float amt = (1 - a_val) / (b_val - a_val);
        a.x = lerp(x, x + resolution, amt);
        a.y = y;
  
        PVector b = new PVector();
        amt = (1 - b_val) / (c_val - b_val);
        b.x = x + resolution;
        b.y = lerp(y, y + resolution, amt);
  
        PVector c = new PVector();
        amt = (1 - d_val) / (c_val - d_val);
        c.x = lerp(x, x + resolution, amt);
        c.y = y + resolution;
  
  
        PVector d = new PVector();
        amt = (1 - a_val) / (d_val - a_val);
        d.x = x;
        d.y = lerp(y, y + resolution, amt);  
       stroke(255);
       strokeWeight(1);
       switch(state) {
          case 0: 
            // draw nothing!
            break;
          case 1: 
            drawLine(c,d);
            break;
          case 2: 
            drawLine(c,b);
            break;
          case 3: 
            drawLine(b,d);
            break;
          case 4: 
            drawLine(a,b);
            break;
          case 5: 
            drawLine(a,d);
            drawLine(c,b);
            break;
          case 6: 
            drawLine(c,a);
            break;
          case 7: 
            drawLine(a,d);
            break;
          case 8: 
            drawLine(a,d);
            break;
          case 9: 
            drawLine(c,a);
            break;
          case 10: 
            drawLine(c,d);
            drawLine(a,b);
            break;
          case 11: 
            drawLine(a,b);
            break;
          case 12: 
            drawLine(b,d);
            break;
          case 13: 
            drawLine(c,b);
            break;
          case 14: 
            drawLine(c,d);
            break;
          case 15: 
            //drawLine(c,d);
            break;  
         }
       }
     }
   }
}

void drawLine(PVector a, PVector b) {
  line(a.x, a.y, b.x, b.y);
}

int getState(int a, int b, int c, int d) {
  return a*8 + b*4 + c*2 + d*1;
}

void mousePressed() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
       field[i][j] = floor(random(2));
      }
   }
}
