import processing.pdf.*;

void setup() {
  size(600, 600);
  beginRecord(PDF, "collatzConjecture.pdf");
  background(0);
  
  float len = 5;
  float angle = 0.2;
  
  
  for(int i=1; i<10000; i++) {
    IntList sequence = new IntList();
    
    int n = i;
    int steps = 0;
    println("n:", n);
    do {
      sequence.append(n);
      n = collatz(n);
      
    } while(n!=1);
    sequence.append(1);
    sequence.reverse();
    
    resetMatrix();
    translate(0, height/2);
    for(int j=0; j<sequence.size(); j++) {
      int value = sequence.get(j);
      if(value%2==0) {
        rotate(-angle);
      } else {
        rotate(angle);
      }
      
      stroke(255, 50);
      line(0,0,len,0);
      translate(len,0);
      steps++;
    }
    //visualize the list
    
  }
  
  
  endRecord();
  
}

void draw() {
  
      
}


int collatz(int n) {
  if(n%2 == 0) {
     return n/2; 
  } 
  return (n*3+1)/2; 
  
}
