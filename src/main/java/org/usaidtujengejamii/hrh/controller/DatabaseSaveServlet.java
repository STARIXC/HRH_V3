package org.usaidtujengejamii.hrh.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import static utils.OSValidator.isUnix;


/**
 * Servlet implementation class DatabaseSaveServlet
 */
@WebServlet("/DatabaseSaveServlet")
public class DatabaseSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String conn_driver = "com.mysql.cj.jdbc.Driver";
    String host, dbase, user, password;
    static String dbsetup;
    String url, dbconnpath;
    String status;
	/**
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
        @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		try {
			 PrintWriter out = response.getWriter();
	            status = "";
	            if (request.getParameter("hostname") == null) {
	                host = "localhost:3306";
	            } else {
	                host = request.getParameter("hostname");
	            }

	            if (request.getParameter("database") == null) {
	                dbase = "hrh";
	            } else {
	                dbase = request.getParameter("database");
	            }
	            if (request.getParameter("user") == null) {
	                user = "root";
	            } else {
	                user = request.getParameter("user");
	            }
	            if (request.getParameter("password") == null) {
	                password = "";
	            } else {
	                password = request.getParameter("password");
	            }

	            System.out.println("pass entered is : " + password);

	            //CREATE A PATH IN THE COMPUTER FOR STORING TEXT FILES
	            String allpath = getServletContext().getRealPath("/dbase.txt");
	            String mydrive = allpath.substring(0, 1);
	            dbconnpath = mydrive + ":\\HRH\\DO_NOT_DELETE\\_\\_\\";
	            dbsetup = dbconnpath + "\\dbconnection.txt";
	            if (isUnix()) {
	                dbconnpath = "HRH/DO_NOT_DELETE/_/_/";
	                dbsetup = dbconnpath + "/dbconnection.txt";
	            }
	            //CREATE A DIRECTORY
	            new File(dbconnpath).mkdirs();
	            //write into the File
	            try {
	                FileWriter fw = new FileWriter(dbsetup);
                             try (BufferedWriter bw = new BufferedWriter(fw)) {
                                 bw.write(host + "\n" + dbase + "\n" + user + "\n" + password.trim());
                             }
	            } catch (IOException e) {
	            }//get line count
	            getLineCount(dbsetup);
	            response.setContentType("text/html;charset=UTF-8");
	            url = "jdbc:mysql://" + host + "/" + dbase + "";
	            status = "failed";
	            try {
	                System.out.println("Connecting databse ...");
	             Class.forName(conn_driver);
	                DriverManager.getConnection(url, user, password);
	                System.out.println("Database Connected!");
	                status = "success";
	            } catch (SQLException | ClassNotFoundException e) {
	                status = "failed";
	                System.out.println("status : " + status + " error " + e);
	            }
	            System.out.println("status : " + status);
	            out.println(status);
	        } catch (FileNotFoundException nf) {
	        }
		// TODO Auto-generated method stub
	}
	private void getLineCount(String dbsetup2) throws IOException {
		  File file = new File(dbsetup);
	        // Open the file
	        FileInputStream fstream = new FileInputStream(file);
            try ( // Get the object of DataInputStream
                    DataInputStream in = new DataInputStream(fstream)) {
                BufferedReader br = new BufferedReader(new InputStreamReader(in));
                String strLine;
                //Read File Line By Line
                while ((strLine = br.readLine()) != null) {
                    // Print the content on the console
                    System.out.println("==" + strLine);
                }
                //Close the input stream
            }
		
	}
    public void createdb() {
        try {
            URL location = DatabaseConnection.class.getProtectionDomain().getCodeSource().getLocation();
            String mydrive = location.getFile().substring(1, 2);
            String command = mydrive + ":/Program Files/MySQL/MySQL Server 5.6/bin mysql -u -p" + password + "" + dbase + " FILE.sql";
            if (isUnix()) {
                command = "mysql -u root -p" + password + "" + dbase + " FILE.sql";
            }
            Runtime.getRuntime().exec(command);
        } catch (IOException ex) {
                Logger.getLogger(DatabaseSaveServlet.class.getName()).log(Level.SEVERE,null,ex);
        }

    }

}
