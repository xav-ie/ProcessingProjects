import java.util.ArrayList;
import java.util.List;
import java.io.*;

class Utility  
{  

  public static List<String> readFile() {
    try  
    {  
      List<String> toReturn = new ArrayList<String>();
      File file=new File("/Users/xruiz/Documents/Processing/TSP_DUMAS/data/n20w20.txt");    //creates a new file instance  
      FileReader fr=new FileReader(file);   //reads the file  
      BufferedReader br=new BufferedReader(fr);  //creates a buffering character input stream  
      String line;  
      while ((line=br.readLine())!=null)  
      {  
        toReturn.add(line);
      }  
      fr.close();    //closes the stream and release the resources  
      return toReturn;
    }  
    catch(IOException e)  
    {  
      e.printStackTrace();
      return null;
    }
  }


  public static String[][] parseInfo(List<String> lines) {
    // 6 lines useless at top, 1 useless at bottom
    String[][] cityInfo = new String[lines.size()-6-1][7];

    for (int i=6; i<lines.size()-1; i++) {
      //System.out.println(lines.get(i));
      List<String> toReturn = new ArrayList<String>();
      String[] curLine = lines.get(i).split("\\s+");
      for(int j=1; j<curLine.length; j++) {
        //System.out.print(curLine[j]+",");
        cityInfo[i-6][j-1] = curLine[j];
      }
      //System.out.println();
    } 
    return cityInfo;
  }
  
  
  public static void printArray(Object[] things) {
     for(int i=0; i<things.length; i++) {
       System.out.println(things[i]);
     } 
  }
  
  public static void printArray2D(Object[][] things) {
     for(int i=0; i<things.length; i++) {
       for(int j=0; j<things[i].length; j++) {
         System.out.print(things[i][j]+"\t");
       }
       System.out.println();
     } 
  }
  
}  
