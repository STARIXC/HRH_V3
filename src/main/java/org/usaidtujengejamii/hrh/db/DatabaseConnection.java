package org.usaidtujengejamii.hrh.db;

import utils.OSValidator;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DatabaseConnection {

    public ResultSet rs;
    public Statement st;
    public PreparedStatement pst;
    public CallableStatement csm;
    public String mydrive = "";
    public static int issetdbcalled_file_exists = 2;
    public static int issetdbcalled_exception = 2;
    public static int issetdbcalled_wrongpword = 2;
    public String dbsetup[] = new String[4];
    public Connection conn = null;

    public static String conn_driver = "com.mysql.cj.jdbc.Driver";

    public DatabaseConnection() {

        try {
            Class.forName(conn_driver).newInstance();
            //if the saved host name is less than 2 letters long, then thats not a genuine host name
            URL location = DatabaseConnection.class.getProtectionDomain().getCodeSource().getLocation();
            mydrive = location.getFile().substring(1, 2);

            if (getdbsettings(mydrive) == true) {

                //String myfile=getServletContext().getRealPath("/dbsettings.txt");
                if (dbsetup[0] != null) {
                    if (dbsetup[3] == null) {
                        conn = DriverManager.getConnection("jdbc:mysql://" + dbsetup[0] + "/" + dbsetup[1], dbsetup[2], "");
                    } else {
                        //System.out.println("jdbc:mysql://" + dbsetup[0] + "/" + dbsetup[1]+","+ dbsetup[2]+","+dbsetup[3]);   

                        conn = DriverManager.getConnection("jdbc:mysql://" + dbsetup[0] + "/" + dbsetup[1], dbsetup[2], dbsetup[3]);
                    }

                    //System.out.println("connection is : "+conn);
                } else {
                    //call the page thats sets up the database

                    if (issetdbcalled_wrongpword % 2 == 0) {

                        issetdbcalled_wrongpword++;
                    } else {
                        issetdbcalled_wrongpword++;
                    }

                }

                issetdbcalled_exception = 2;
                issetdbcalled_file_exists = 2;
                issetdbcalled_wrongpword = 2;

                st = conn.createStatement();


            }

        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("ERROR WHILE CONNECTING TO DATABASE. CHECK YOUR CONNECTION CREDENTIALS SETTINGS in dbConn.java");
            //error in dbase configuration 
            //call the jsp page that does configuration

            if (issetdbcalled_exception % 2 == 0) {

                issetdbcalled_exception++;
            } else {
                issetdbcalled_exception++;
            }

        }
    }

    public final boolean getdbsettings(String drive) {
        boolean worked = true;

        try {

            String dbconnpath = "";

            if (OSValidator.isWindows()) {
                dbconnpath = drive + ":/HRH/DO_NOT_DELETE/_/_/dbconnection.txt";
            } else if (OSValidator.isUnix()) {
                dbconnpath = "HRH/DO_NOT_DELETE/_/_/dbconnection.txt";
            }
            //File file = new File("");
            // InputStream inStream = getClass().getResourceAsStream("Web-INF/classes/dbconnection.txt");  
            FileInputStream fstream = new FileInputStream(dbconnpath);
            try ( // Get the object of DataInputStream
                    DataInputStream in = new DataInputStream(fstream)) {
                BufferedReader br = new BufferedReader(new InputStreamReader(in));
                String stLine;
                //Read File Line By Line
                int count = 0;
                while ((stLine = br.readLine()) != null) {
                    // Print the content on the console
                    dbsetup[count] = stLine;
                    
                    if (count < 4) {
                        count++;
                    }
                }
                //Close the input stream
            }
        } catch (IOException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);

            System.out.println("MY VALUE:" + issetdbcalled_file_exists);

            if (issetdbcalled_file_exists % 2 == 0) {

                calldbjsp();
                issetdbcalled_file_exists++;
            } else {
                issetdbcalled_file_exists++;
            }

            System.out.println("MY VALUE:" + issetdbcalled_file_exists);

            System.out.println("ERROR:      FILE NOT FOUND");
            worked = false;

        }

        return worked;

    }

    public void calldbjsp() {
        try {

            //not so good for now because the host name is static
            String url = "http://localhost:8080/hrh/dataconfig.jsp";
            java.awt.Desktop.getDesktop().browse(java.net.URI.create(url));
        } catch (IOException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
 public  void closeConnection() throws SQLException {
       if (conn != null) {
           conn.close();
           conn = null;
        }
   }

}
