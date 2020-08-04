import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class MarchingSquares extends PApplet {

float[][] field;
final int resolution = 10;
int cols, rows;

public void setup() {
   
   cols = width / resolution;
   rows = height / resolution;
   field = new float[rows][cols];
   for (int i = 0; i < cols; i++) {
     for (int j = 0; j < rows; j++) {
       field[i][j] = random(1);
     }
   }
}

public void draw() {
  background(40);
  for (int i = 0; i < cols; i++) {
     for (int j = 0; j < rows; j++) {
       stroke(field[i][j]*255);
       point(i*resolution, j*resolution);
     }
   }
}
  public void settings() {  size(600,400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "MarchingSquares" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
