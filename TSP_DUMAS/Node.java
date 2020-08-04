class Node {
  public static int CUST_NUM = 0;

  public int customerNumber;
  public Coordinate coord;
  public float demand, readyTime, dueDate, serviceTime;

  public Node(Coordinate coord, float demand, float readyTime, float dueDate, float serviceTime) {
    this.coord = coord;
    this.demand = demand;
    this.readyTime = readyTime;
    this.dueDate = dueDate;
    this.serviceTime = serviceTime;
    this.customerNumber = ++CUST_NUM;

    //System.out.println("wooooOOOooooOOOOoooo");
  }



  public String toString() {
    String toReturn = "ID: "+Integer.toString(this.customerNumber)+"\t";
    toReturn += "DEMAND: "+Float.toString(this.demand)+"\t";
    toReturn += "READY_TIME: "+Float.toString(this.readyTime)+"\t";
    toReturn += "DUE_DATE: "+Float.toString(this.dueDate)+"\t";
    toReturn += "SERVICE_TIME: "+Float.toString(this.serviceTime)+"\t";
    toReturn += "COORDINATES: "+this.coord.toString()+"\t";
    return toReturn;
  }
}
