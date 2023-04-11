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
    String fname, mname, lname, username, password, pass, level, userid, fullname;

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
    
//    public int addUser() {
//        int save = 0;
//        try {
//            String sql = "INSERT INTO `hrh`.`tbl_user`(`userid`,`fname`,`mname`,`lname`,`username`,`email`,`phone`,`password`,`level`,`facility`)VALUES(?,?,?,?,?,?,?,?,?,?)";
//
//            save = conn.pst.executeUpdate();
//
//        } catch (SQLException e) {
//              Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
//        }
//        return save;
//    }
}
