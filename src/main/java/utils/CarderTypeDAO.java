package utils;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.CarderType;

/**
 *
 * @author STARIXC
 */
public class CarderTypeDAO {

    private final DatabaseConnection conn;
    public static final String INSERT_CARDER_TYPE = "REPLACE INTO cadre_type(cadre_type_name,hrs_per_week) VALUES (?,?)";
    public static final String DELETE_CARDER_TYPE = "DELETE FROM cadre_type WHERE id= ?";
    public static final String UPDATE_CARDER_TYPE = "UPDATE cadre_type SET cadre_type_name = ?,hrs_per_week = ? WHERE id= ?";
    public static final String SELECT_ALL_CARDER_TYPES = "SELECT c.id as carderT_id ,c.cadre_type_name as cadre_type_name,c.hrs_per_week as hours_per_week FROM hrh.cadre_type c";
    
    public CarderTypeDAO() {
        conn = new DatabaseConnection();
    }

    public List<CarderType> getAllCarderType() {
        List<CarderType> carders = new ArrayList<>();

        try {
            conn.rs = conn.st.executeQuery(SELECT_ALL_CARDER_TYPES);
            while (conn.rs.next()) {
                CarderType carderT = new CarderType();
                carderT.setId(Integer.parseInt(conn.rs.getString("carderT_id")));
                carderT.setCadre_type_name(conn.rs.getString("cadre_type_name"));
                carderT.setHrs_per_week(conn.rs.getString("hours_per_week"));
                carders.add(carderT);
            }
        } catch (SQLException e) {
            Logger.getLogger(CarderTypeDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        //System.out.print(positions);
        return carders;
    }

    public void addCarderType(CarderType ct) {
        try {
            conn.pst = conn.conn.prepareStatement(INSERT_CARDER_TYPE);
            conn.pst.setString(1, ct.getCadre_type_name());
            conn.pst.setString(2, ct.getHrs_per_week());
            conn.pst.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CarderTypeDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void updateCarderType(CarderType ctype) {

        try {
            conn.pst = conn.conn.prepareStatement(UPDATE_CARDER_TYPE);
            conn.pst.setString(1, ctype.getCadre_type_name());
            conn.pst.setString(2, ctype.getHrs_per_week());
            conn.pst.setInt(3, ctype.getId());
            conn.pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CarderTypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public CarderType getCarderTypeById(int carder_id) {
        CarderType ctype = new CarderType();
        try {
           String SELECT_CARDER_TYPE_ID = "SELECT * from cadre_type where id='"+carder_id+"'";
            conn.rs = conn.st.executeQuery(SELECT_CARDER_TYPE_ID);
             while (conn.rs.next()) {
                ctype.setId(conn.rs.getInt("id"));
                ctype.setCadre_type_name(conn.rs.getString("cadre_type_name"));
                ctype.setHrs_per_week(conn.rs.getString("hrs_per_week"));
             }
           
    
        } catch (SQLException ex) {
            Logger.getLogger(CarderTypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ctype;
    }

    public int deleteCtype(int cat_type_id) {
       
        int i = 0;
        try {
            String sql = "DELETE from cadre_type where id=?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setInt(1, cat_type_id);
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
            Logger.getLogger(CarderTypeDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return i;
    }
 
}
