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
import models.CarderCat;

/**
 *
 * @author UTJ
 */
public class CarderCatDAO {

    private final DatabaseConnection conn;
    public static final String INSERT_CARDER_CAT = "REPLACE INTO cadre_category(cadre_category_name) VALUES (?)";
    public static final String DELETE_CARDER_CAT = "DELETE FROM cadre_category WHERE id= ?";
    public static final String UPDATE_CARDER_CAT = "UPDATE cadre_category SET cadre_category_name = ? WHERE id= ?";
    public static final String SELECT_ALL_CARDER_CATS = "SELECT c.id as carderT_id ,c.cadre_category_name as cadre_category_name FROM hrh.cadre_category c";

    public CarderCatDAO() {
        conn = new DatabaseConnection();
    }

    public List<CarderCat> getAllCarderCat() {
        List<CarderCat> carders = new ArrayList<>();

        try {
            conn.rs = conn.st.executeQuery(SELECT_ALL_CARDER_CATS);
            while (conn.rs.next()) {
                CarderCat carderT = new CarderCat();
                carderT.setId(Integer.parseInt(conn.rs.getString("carderT_id")));
                carderT.setCadre_category_name(conn.rs.getString("cadre_category_name"));

                carders.add(carderT);
            }
        } catch (SQLException e) {
            Logger.getLogger(CarderCatDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        //System.out.print(positions);
        return carders;
    }

    public void addCarderCat(CarderCat ccat) {
        try {
            conn.pst = conn.conn.prepareStatement(INSERT_CARDER_CAT);
            conn.pst.setString(1, ccat.getCadre_category_name());
           
            conn.pst.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CarderCatDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void updateCarderCat(CarderCat ccat ) {

        try {
            conn.pst = conn.conn.prepareStatement(UPDATE_CARDER_CAT);
            conn.pst.setString(1, ccat.getCadre_category_name());
            conn.pst.setInt(2, ccat.getId());
            conn.pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CarderCatDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
//  public void updateCarderType(CarderType ctype) {
//
//        try {
//            conn.pst = conn.conn.prepareStatement(UPDATE_CARDER_TYPE);
//            conn.pst.setString(1, ctype.getCadre_type_name());
//            conn.pst.setString(2, ctype.getHrs_per_week());
//            conn.pst.setInt(3, ctype.getId());
//            conn.pst.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(CarderTypeDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//    }


    public CarderCat getCarderCatById(int carder_id) {
        CarderCat ccat = new CarderCat();
        try {
            String SELECT_CARDER_CAT_ID = "SELECT * from cadre_category where id='" + carder_id + "'";
            conn.rs = conn.st.executeQuery(SELECT_CARDER_CAT_ID);
            while (conn.rs.next()) {
                ccat.setId(conn.rs.getInt("id"));
                ccat.setCadre_category_name(conn.rs.getString("cadre_category_name"));
           
            }

        } catch (SQLException ex) {
            Logger.getLogger(CarderCatDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ccat;
    }

    public int deleteCarderCat(int cat_id) {
             
        int i = 0;
        try {
            String sql = "DELETE from cadre_category where id=?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setInt(1, cat_id);
            //  conn.pst.executeUpdate();
            int submit = conn.pst.executeUpdate();

            if (submit > 0) {
                i = +1;
            } else {
                System.out.println(submit);
                i = +submit;
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(CarderCatDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return i;
   }



 
}
