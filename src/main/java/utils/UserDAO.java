/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.security.MessageDigest;
import java.sql.SQLException;
import models.Login;

/**
 *
 * @author UTJ
 */
public class UserDAO {

    private final DatabaseConnection conn;
    String found;
    MessageDigest m;
    String fname, mname, lname, username, password, pass,  userid, fullname;
    int level;
    public UserDAO() {
        conn = new DatabaseConnection();
    }

    public boolean recordExists(String userid) {
        try {
            String query = "SELECT * FROM user WHERE userid = ? ";
            conn.pst = conn.conn.prepareStatement(query);
            conn.pst.setString(1, userid);

            conn.pst.executeQuery();
            return conn.rs.next();
        } catch (SQLException ex) {
            System.out.println("Error checking record existence: " + ex.getMessage());
        }
        return false;
    }

    public boolean addUser(Login user) throws SQLException {
        String query = "INSERT INTO user(userid, fname, mname, lname, username, email, phone, password, level_, facility, scounty, status) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        conn.pst = conn.conn.prepareStatement(query);
//				declare parameters starting with 1
        conn.pst.setString(1, user.getUserid());
        conn.pst.setString(2, user.getFname());
        conn.pst.setString(3, user.getMname());
        conn.pst.setString(4, user.getLname());
        conn.pst.setString(5, user.getUsername());
        conn.pst.setString(6, user.getEmail());
        conn.pst.setString(7, user.getPhone());
        conn.pst.setString(8, user.getPassword());
        conn.pst.setInt(9, user.getLevel());
        conn.pst.setString(10, user.getFacility());
        conn.pst.setString(11, user.getScounty());
        conn.pst.setInt(12, user.getStatus());

        conn.pst.executeUpdate();
        return true;
    }

    public boolean addRelationship(String emp_no, int position_id) throws SQLException {
        String query = "INSERT INTO hrh.tbl_employee_position_relations(emp_no, position_id )VALUES (?,?)";
        conn.pst = conn.conn.prepareStatement(query);
        conn.pst.setString(1, emp_no);
        conn.pst.setInt(2, position_id);
        conn.pst.executeUpdate();
          return true;
    }
    
public Login getUserById(String userid) {
    try {
        String query = "SELECT * FROM tbl_user WHERE userid = ?";
        conn.pst = conn.conn.prepareStatement(query);
        conn.pst.setString(1, userid);

        conn.rs = conn.pst.executeQuery();
        if (conn.rs.next()) {
            Login user = new Login();
            user.setUserid(conn.rs.getString("userid"));
            user.setFname(conn.rs.getString("fname"));
            user.setMname(conn.rs.getString("mname"));
            user.setLname(conn.rs.getString("lname"));
            user.setUsername(conn.rs.getString("username"));
            user.setEmail(conn.rs.getString("email"));
            user.setPhone(conn.rs.getString("phone"));
            user.setPassword(conn.rs.getString("password"));
            user.setLevel(conn.rs.getInt("level_"));
//            user.setFacility(conn.rs.getString("facility"));
//            user.setScounty(conn.rs.getString("scounty"));
            user.setStatus(conn.rs.getInt("status"));

            level = user.getLevel();
            switch (level) {
                case 2:
                    {
                        String facilityQuery = "SELECT  facility_id FROM hrh.tbl_user_facility WHERE user_id = ?";
                        conn.pst = conn.conn.prepareStatement(facilityQuery);
                        conn.pst.setString(1, userid);
                        conn.rs = conn.pst.executeQuery();
                        if (conn.rs.next()) {
                            user.setFacility(conn.rs.getString("facility_id"));
                        }       break;
                    }
                case 5:
                    {
                        String facilityQuery = "SELECT mflc FROM hrh.tbl_facility_supervisor WHERE login_id = ?";
                        conn.pst = conn.conn.prepareStatement(facilityQuery);
                        conn.pst.setString(1, userid);
                        conn.rs = conn.pst.executeQuery();
                        if (conn.rs.next()) {
                            user.setFacility(conn.rs.getString("mflc"));
                        }       break;
                    }
                case 6:
                    String mdtRegionQuery = "SELECT mdtregion FROM hrh.technical_monitors WHERE login_id = ?";
                    conn.pst = conn.conn.prepareStatement(mdtRegionQuery);
                    conn.pst.setString(1, userid);
                    conn.rs = conn.pst.executeQuery();
                    if (conn.rs.next()) {
                        user.setMdtregion(conn.rs.getString("mdtregion"));
                    }   break;
                default:
                    break;
            }

            return user;
        }
    } catch (SQLException ex) {
        System.out.println("Error retrieving user by ID: " + ex.getMessage());
    }
    return null; // User not found or an error occurred
}

public boolean updateUserRole(String userid, int newRole) {
    try {
        String query = "UPDATE hrh.tbl_user SET level_ = ? WHERE userid = ?";
        conn.pst = conn.conn.prepareStatement(query);
        conn.pst.setInt(1, newRole);
        conn.pst.setString(2, userid);

        int rowsAffected = conn.pst.executeUpdate();
        return rowsAffected > 0;
    } catch (SQLException ex) {
        System.out.println("Error updating user role: " + ex.getMessage());
    }
    return false; // Update failed
}

}
