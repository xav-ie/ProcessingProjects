import java.util.ArrayList;
import java.util.List;
import java.io.*;

class Cities {
  Node[] cities;
  
  Cities() {
    List<String> lines = Utility.readFile();
    String[][] cityInfo = Utility.parseInfo(lines);
    this.cities = Cities.makeCities(cityInfo);
  }


  public static Node[] makeCities(String[][] cityInfo) {
    Node[] cities = new Node[cityInfo.length];

    for (int i=0; i<cities.length; i++) {
      String[] currentInfo = cityInfo[i];
      Node currentNode = new Node(new Coordinate(Float.parseFloat(currentInfo[1]), 
        Float.parseFloat(currentInfo[2])), Float.parseFloat(currentInfo[3]), Float.parseFloat(currentInfo[4]), 
        Float.parseFloat(currentInfo[5]), Float.parseFloat(currentInfo[6]));
      cities[i] = currentNode;
    }

    return cities;
  }


  public static void printCities(Node[] cities) {
    for (int i=0; i<cities.length; i++) {
      System.out.println(cities[i]);
    }
  }
  
  
}
