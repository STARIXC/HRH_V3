
package utils;

/**
 *
 * @author UTJ
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.*;
import java.util.Timer;
import java.util.TimerTask;

public class Scheduler {
  public static void main(String[] args) {
    Timer timer = new Timer();
    timer.scheduleAtFixedRate(new TimerTask() {
      @Override
      public void run() {
//        try {
//          URL url = new URL("http://localhost:8080/aHRIM/contractEnder");
//          HttpURLConnection con = (HttpURLConnection) url.openConnection();
//          con.setRequestMethod("GET");
//          int responseCode = con.getResponseCode();
//          if (responseCode == HttpURLConnection.HTTP_OK) {
//              try (BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()))) {
//                  String inputLine;
//                  while ((inputLine = in.readLine()) != null) {
//                      System.out.println(inputLine);
//                  } }
//          }
//        } catch (IOException e) {
//          e.printStackTrace();
//        }
      }
    }, 0, 24 * 60 * 60 * 1000);
  }
}
