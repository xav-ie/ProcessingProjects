class  Coordinate {
  float x, y, z;
  float numSigCoordinates;

  public Coordinate(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.numSigCoordinates = 3;
  }

  public Coordinate(float x, float y) {
    this(x, y, 0);
    this.numSigCoordinates = 2;
  }


  public Coordinate() {
    this(0, 0, 0); 
    this.numSigCoordinates = 0;
  }


  public String toString() {
    if (this.numSigCoordinates == 3) {
      return "("+Float.toString(x)+","+Float.toString(y)+","+Float.toString(z)+")";
    } else if (this.numSigCoordinates == 2) {
      return "("+Float.toString(x)+","+Float.toString(y)+")";
    } else {
      return "()";
    }
  }
}
