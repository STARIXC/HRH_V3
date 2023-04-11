package org.usaidtujengejamii.hrh.controller;

import utils.IdGen;
import utils.UserDAO;
import utils.JSONConverter;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Login;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;

/**
 *
 * @author UTJ
 */
public class ManageUsers extends HttpServlet {

    private JSONConverter json;
    public UserDAO dao;
    PrintWriter out;
    HttpSession session;
    private String userid, fname, mname, lname, username, email, phone, password,  facility, scounty,full_name,subcounty,pass,created_at;
   private int level,status;
    String found;
    MessageDigest m;
    private final DatabaseConnection conn;

    public ManageUsers() {
        super();
        dao = new UserDAO();
        conn = new DatabaseConnection();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException, SQLException {
        out = response.getWriter();
        // setting the response type
        response.setContentType("application/json");
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("add_user")) {
            session = request.getSession();
            fname = request.getParameter("txtFirstName").toUpperCase();
            mname = request.getParameter("txtMiddleName").toUpperCase();
            lname = request.getParameter("txtSurname").toUpperCase();
            username = request.getParameter("txtUsername");
            email = request.getParameter("txtEmail");
            phone = request.getParameter("txtPhone");
            pass = request.getParameter("txtPassword");
            level = Integer.parseInt( request.getParameter("ddlLevel"));

            if (level ==1 || level ==3  || level ==4) {
                subcounty = request.getParameter("ddlSubcounty");
                facility = request.getParameter("ddlFacility");

            } else {
                subcounty = "All";
                facility = "All";
            }
            IdGen IG = new IdGen();
            userid = IG.current_id();
            m = MessageDigest.getInstance("MD5");
            m.update(pass.getBytes(), 0, pass.length());
            password = new BigInteger(1, m.digest()).toString(16);
            String checker = "SELECT userid FROM tbl_user WHERE (fname=? && mname=? && lname=?) || username=? || userid=?";
            conn.pst = conn.conn.prepareStatement(checker);
            conn.pst.setString(1, fname);
            conn.pst.setString(2, mname);
            conn.pst.setString(3, lname);
            conn.pst.setString(4, username);
            conn.pst.setString(5, userid);

            conn.rs = conn.pst.executeQuery();
            if (conn.rs.next() == true) {

                out.println("User Already Exists");
            } else {
//     ADD THE USER
                String inserter = "INSERT INTO `hrh`.`tbl_user`(`userid`,`fname`,`mname`,`lname`,`username`,`email`,`phone`,`password`,`level`,`facility`,`scounty`,status)VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
                conn.pst = conn.conn.prepareStatement(inserter);
                conn.pst.setString(1, userid);
                conn.pst.setString(2, fname);
                conn.pst.setString(3, mname);
                conn.pst.setString(4, lname);
                conn.pst.setString(5, username);
                conn.pst.setString(6, email);
                conn.pst.setString(7, phone);
                conn.pst.setString(8, password);
                conn.pst.setInt(9, level);
                conn.pst.setString(10, facility);
                conn.pst.setString(11, subcounty);
                conn.pst.setInt(12, 1);
                conn.pst.executeUpdate();
                full_name = fname + " " + mname + " " + lname;
            }
            out.println(full_name);

        } else if (action.equalsIgnoreCase("update_role")) {

        } else if (action.equalsIgnoreCase("all")) {
            
            String users = JSONConverter.convert(getAllUsers());
//            System.out.println(users);
            
             out.println(users);
        } else if (action.equalsIgnoreCase("edit")) {

        } else {

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException | SQLException ex) {
            Logger.getLogger(ManageUsers.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException | SQLException ex) {
            Logger.getLogger(ManageUsers.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private List<Login> getAllUsers() {
        List<Login> accounts = new ArrayList<>();
        
//           String userid, fname, mname, lname, username, email, phone, password, level, facility, scounty,full_name;
        try {
            String SELECT_USERS = "SELECT * from tbl_user";
            conn.rs = conn.st.executeQuery(SELECT_USERS);
            while (conn.rs.next()) {
                Login login = new Login();
                userid = conn.rs.getString("userid");
                fname = conn.rs.getString("fname");
                mname = conn.rs.getString("mname");
                lname = conn.rs.getString("lname");
                full_name = fname + " " + mname + " " + lname;
                username = conn.rs.getString("username");
                email = conn.rs.getString("email");
                phone = conn.rs.getString("phone");
                password = conn.rs.getString("password");
                level = Integer.parseInt( conn.rs.getString("level"));
                facility = conn.rs.getString("facility");
                subcounty = conn.rs.getString("scounty");
                status=Integer.parseInt(conn.rs.getString("status"));
                created_at=conn.rs.getString("created_at");
                
                login.setUserid(userid);
                login.setFname(fname);
                login.setMname(mname);
                login.setLname(lname);
                login.setFull_name(full_name);
                login.setUsername(username);
                login.setEmail(email);
                login.setPhone(phone);
                login.setPassword(password);
                login.setLevel(level);
                login.setFacility(facility);
                login.setScounty(subcounty);
                login.setStatus(status);
                login.setCreated_at(created_at);
                
                accounts.add(login);
//                county = conn.rs.getString("userid");

            }

        } catch (SQLException ex) {
            Logger.getLogger(ManageUsers.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }

}
