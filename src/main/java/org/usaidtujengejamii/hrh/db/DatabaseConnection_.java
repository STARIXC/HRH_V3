package org.usaidtujengejamii.hrh.db;

import java.awt.Desktop;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnection_ {

    private static final String DB_CONNECTION_FILE_WINDOWS = "C:\\HRH\\DO_NOT_DELETE\\_\\_\\dbconnection.txt";
    private static final String DB_CONNECTION_FILE_LINUX = "/HRH/DO_NOT_DELETE/_/_/dbconnection.txt";
    private static final String DB_DRIVER_CLASS = "com.mysql.cj.jdbc.Driver";
    private static final String DB_URL_PREFIX = "jdbc:mysql://";
    private static final String DB_URL_SUFFIX = "?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    public Connection conn;
    public ResultSet rs;
    public Statement st;
    public PreparedStatement pst;
    private CallableStatement csm;
    private String password;

    public DatabaseConnection_() throws SQLException {
        loadProperties();
        openConnection();
    }

    private void loadProperties() {
        String filePath = "";
        if (System.getProperty("os.name").toLowerCase().contains("windows")) {
            filePath = DB_CONNECTION_FILE_WINDOWS;
        } else {
            filePath = DB_CONNECTION_FILE_LINUX;
        }
        File file = new File(filePath);
        if (!file.exists()) {
            callDbConfigJsp();
        } else {
            try ( BufferedReader br = new BufferedReader(new FileReader(filePath))) {
                String hostnameAndPort = br.readLine();
                String databaseName = br.readLine();
                String username = br.readLine();
                password = br.readLine();
                String url = DB_URL_PREFIX + hostnameAndPort + "/" + databaseName + DB_URL_SUFFIX;
                Class.forName(DB_DRIVER_CLASS);
                conn = DriverManager.getConnection(url, username, password);
                st = conn.createStatement();
                rs = null;
                pst = null;
                csm = null;
            } catch (ClassNotFoundException | SQLException | IOException e) {
                throw new RuntimeException("Failed to load database properties or connect to database", e);
            }
        }
    }

    private void openConnection() throws SQLException {
        if (conn == null || conn.isClosed()) {
            throw new RuntimeException("Failed to establish database connection");
        }
    }

    public Connection getConnection() {
        return conn;
    }

    public ResultSet getResultSet() {
        return rs;
    }

    public Statement getStatement() {
        return st;
    }

    public PreparedStatement getPreparedStatement() {
        return pst;
    }

    public CallableStatement getCallableStatement() {
        return csm;
    }

    public void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                // Ignore
            }
        }
    }

    public void closeResultSet(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                // Ignore
            }
        }
    }

    public void closePreparedStatement(PreparedStatement ps) {
        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException e) {
                // Ignore
            }
        }
    }

    private void callDbConfigJsp() {
        try {
            String url = "http://localhost:8080/hrh/dataconfig.jsp";
            Desktop.getDesktop().browse(new URI(url));
        } catch (IOException | URISyntaxException e) {
            throw new RuntimeException("Failed to open database configuration page", e);
        }
    }

}
