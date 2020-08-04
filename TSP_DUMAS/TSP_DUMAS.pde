import java.util.ArrayList;
import java.util.List;
Cities allCities;

void setup() {
  size(600,600);
  allCities = new Cities();
  System.out.println(allCities.cities.length);
}


void draw() {
  background(0,255,255);
  fill(255,255,0);
  noStroke();
  if(mousePressed==true) fill(0);
  for (int i=0; i<allCities.cities.length; i++) {
    circle(allCities.cities[i].coord.x*10+50, allCities.cities[i].coord.y*10+50, 20);
  }
  
  
}
