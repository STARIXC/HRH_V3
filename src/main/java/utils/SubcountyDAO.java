/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.SubCounty;

/**
 *
 * @author UTJ
 */
public class SubcountyDAO {

    private final DatabaseConnection conn;
    public static final String SELECT_ALL_S = "Select * from district ";

    public SubcountyDAO() {
        conn = new DatabaseConnection();
    }

    public List<SubCounty> getAllSubCounty() {
        List<SubCounty> scounty = new ArrayList<>();

        try {
            conn.rs = conn.st.executeQuery(SELECT_ALL_S);
            while (conn.rs.next()) {
                SubCounty subcounty = new SubCounty();
                subcounty.setDistrictID(Integer.parseInt(conn.rs.getString("DistrictID")));
                subcounty.setCountyID(Integer.parseInt(conn.rs.getString("CountyID")));
                subcounty.setDistrictNom(conn.rs.getString("DistrictID"));
                subcounty.setActive(Integer.parseInt(conn.rs.getString("active")));
                scounty.add(subcounty);
            }
        } catch (SQLException e) {
            Logger.getLogger(ScarderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        //System.out.print(positions);
        return scounty;
    }

    public List<SubCounty> getSubCountyByCountyId(String CountyID) {
        List<SubCounty> scounty = new ArrayList<>();
        try {
            String SELECT_ALL_By_CID = "Select * from district where CountyID='" + CountyID + "' AND active=1";
            conn.rs = conn.st.executeQuery(SELECT_ALL_By_CID);
            while (conn.rs.next()) {
                SubCounty subcounty = new SubCounty();
                subcounty.setDistrictID(Integer.parseInt(conn.rs.getString("DistrictID")));
                subcounty.setCountyID(Integer.parseInt(conn.rs.getString("CountyID")));
                subcounty.setDistrictNom(conn.rs.getString("DistrictNom"));
                subcounty.setActive(Integer.parseInt(conn.rs.getString("active")));
                scounty.add(subcounty);

            }

        } catch (SQLException ex) {
            Logger.getLogger(ScarderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return scounty;
    }

}
