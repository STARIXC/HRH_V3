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
import models.Login;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;

/**
 *
 * @author UTJ
 */
public class ManageUsers extends HttpServlet {

    private JSONConverter json;
    private final UserDAO dao;
    private PrintWriter out;
    private String userid, fname, mname, lname, username, user_level, email, phone, password, full_name, subcounty, pass, created_at;
    private int level, status;
    private String found;
    private MessageDigest m;
    private final DatabaseConnection conn;

    public ManageUsers() {
        super();
        dao = new UserDAO();
        conn = new DatabaseConnection();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException, SQLException {
        out = response.getWriter();
        response.setContentType("application/json");
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("add_user")) {

            fname = request.getParameter("txtFirstName").toUpperCase();
            mname = request.getParameter("txtMiddleName").toUpperCase();
            lname = request.getParameter("txtSurname").toUpperCase();
            username = request.getParameter("txtUsername");
            email = request.getParameter("txtEmail");
            phone = request.getParameter("txtPhone");
            pass = request.getParameter("txtPassword");
            level = Integer.parseInt(request.getParameter("ddlLevel"));

            IdGen idGen = new IdGen();
            userid = idGen.current_id();
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
            if (conn.rs.next()) {
                out.println("User Already Exists");
            } else {
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
                conn.pst.setInt(10, 1);
                conn.pst.executeUpdate();
                full_name = fname + " " + mname + " " + lname;
            }
            out.println(full_name);
        } else if (action.equalsIgnoreCase("update_role")) {
            userid = request.getParameter("userid");
            int newRole = Integer.parseInt(request.getParameter("newRole"));

            // TODO: Implement code to update the user's role in the database
            // You can use the UserDAO class or directly perform database operations here
            // Example:
            boolean success = dao.updateUserRole(userid, newRole);

            if (success) {
                out.println("User role updated successfully");
            } else {
                out.println("Failed to update user role");
            }
        } else if (action.equalsIgnoreCase("edit")) {
            userid = request.getParameter("userid");

            // TODO: Implement code to retrieve the user's information from the database
            // You can use the UserDAO class or directly perform database operations here
            // Example:
            Login user = dao.getUserById(userid);

            if (user != null) {
                // TODO: Populate the response with the user's information in a suitable format (e.g., JSON)
                // Example:
                String userJson = JSONConverter.convert(user);
                out.println(userJson);
            } else {
                out.println("User not found");
            }
        }  else if (action.equalsIgnoreCase("all")) {

            String users = JSONConverter.convert(getAllUsers());
//            System.out.println(users);

            out.println(users);
        } else {
            out.println("Invalid action");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException | SQLException ex) {
            Logger.getLogger(ManageUsers.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException | SQLException ex) {
            Logger.getLogger(ManageUsers.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private List<Login> getAllUsers() {
        List<Login> accounts = new ArrayList<>();

        try {
            String SELECT_USERS = "SELECT * FROM hrh.tbl_user us left join tbl_roles ur on ur.role_id=us.level_";
            conn.rs = conn.st.executeQuery(SELECT_USERS);
            while (conn.rs.next()) {
                Login login = new Login();
                userid = conn.rs.getString("userid");
                fname = conn.rs.getString("fname");
                mname = conn.rs.getString("mname");
                lname = conn.rs.getString("lname");

                if (fname == null && mname == null && lname == null) {
                    full_name = "undefined";
                } else {
                    StringBuilder fullNameBuilder = new StringBuilder();
                    if (fname != null) {
                        fullNameBuilder.append(fname).append(" ");
                    }
                    if (mname != null) {
                        fullNameBuilder.append(mname).append(" ");
                    }
                    if (lname != null) {
                        fullNameBuilder.append(lname);
                    }
                    full_name = fullNameBuilder.toString().trim();
                }

                username = conn.rs.getString("username");
                email = conn.rs.getString("email");
                phone = conn.rs.getString("phone");
                password = conn.rs.getString("password");
                user_level = conn.rs.getString("role_name");
                level = Integer.parseInt(conn.rs.getString("level_"));

                status = Integer.parseInt(conn.rs.getString("status"));
                created_at = conn.rs.getString("created_at");

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
                login.setStatus(status);
                login.setCreated_at(created_at);
                login.setUser_level(user_level);

                accounts.add(login);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ManageUsers.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }
}
