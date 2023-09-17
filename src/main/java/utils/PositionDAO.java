package utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.util.logging.Level;
import java.util.logging.Logger;

import models.Position;

public class PositionDAO {

    private final DatabaseConnection conn;
    private static final String INSERT_POSITION = "REPLACE INTO cadre_positions(carder_category_id,standardized_cadre_id,position_title,basic_pay) VALUES (?,?,?,?)";
    private static final String DELETE_POSITION = "DELETE FROM cadre_positions WHERE id= ?";
    private static final String UPDATE_POSITION = "UPDATE cadre_positions SET carder_category_id = ?,standardized_cadre_id = ?,position_title = ?,basic_pay=? WHERE id= ?";
    private static final String SELECT_ALL_POSITIONS = "SELECT p.id as position_id ,p.position_title as position_name, "
            + "c.carder_type_id as carder_category_id,"
            + "c.id as standardized_cadre_id,"
            + "c.standardized_cadre_name as standard_cadre_name "
            + "FROM hrh.cadre_positions p "
            + "join standardized_cadre c on c.id=p.standardized_cadre_id";
    private static final String SELECT_POSITION_ID = "SELECT p.id as position_id, p.position_title as position_name,"
            + "c.carder_type_id as carder_category_id,p.basic_pay,"
            + "c.id as standardized_cadre_id,"
            + "c.standardized_cadre_name as standard_cadre_name "
            + " from hrh.cadre_positions p "
            + "join hrh.standardized_cadre c on c.id=p.standardized_cadre_id where p.id=?";

    public PositionDAO() {
        conn = new DatabaseConnection();
    }

    @SuppressWarnings("static-access")
    public List<Position> getAllPosition() {
        List<Position> positions = new ArrayList<>();

        try {
            conn.rs = conn.st.executeQuery(SELECT_ALL_POSITIONS);
            while (conn.rs.next()) {
                Position position = new Position();
                position.setId(Integer.parseInt(conn.rs.getString("position_id")));
                position.setPosition_title(conn.rs.getString("position_name"));
                position.setCarder_category_id(Integer.parseInt(conn.rs.getString("carder_category_id")));
                position.setStandardized_cadre_id(Integer.parseInt(conn.rs.getString("standardized_cadre_id")));
                positions.add(position);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(PositionDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        //System.out.print(positions);
        return positions;
    }

    public int addPosition(Position pos) {
        int i = 0;
        try {

            conn.pst = conn.conn.prepareStatement(INSERT_POSITION);

            conn.pst.setInt(1, pos.getCarder_category_id());
            conn.pst.setInt(2, pos.getStandardized_cadre_id());
            conn.pst.setString(3, pos.getPosition_title());
            conn.pst.setInt(4, pos.getBasic_pay());
            int submit = conn.pst.executeUpdate();

            if (submit > 0) {
                i = +1;
            } else {
                System.out.println(submit);
                i = +submit;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(PositionDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return i;
    }

    public int deletePosition(int typeID) {

        int i = 0;
        try {
//            String sql = "DELETE from standardized_cadre where id=?";
            conn.pst = conn.conn.prepareStatement(DELETE_POSITION);
            conn.pst.setInt(1, typeID);
            //  conn.pst.executeUpdate();
            int submit = conn.pst.executeUpdate();

            if (submit > 0) {
                i = +1;
            } else {
//                System.out.println(submit);
                i = +submit;
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(PositionDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return i;
    }

    public int updatePosition(Position pos) throws SQLException {
        int _Updated = 0;
        try {

            conn.pst = conn.conn.prepareStatement(UPDATE_POSITION);
            conn.pst.setInt(1, pos.getCarder_category_id());
            conn.pst.setInt(2, pos.getStandardized_cadre_id());
            conn.pst.setString(3, pos.getPosition_title());
            conn.pst.setInt(4, pos.getBasic_pay());
            conn.pst.setInt(5, pos.getId());
            int submit = conn.pst.executeUpdate();

            if (submit > 0) {
                _Updated = +1;
            } else {
//                System.out.println(submit);
                _Updated = +submit;
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(PositionDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return _Updated;

    }

    public Position getPositionById(int id) {
        Position pos = null;

        try {

            conn.pst = conn.conn.prepareStatement(SELECT_POSITION_ID);
            conn.pst.setInt(1, id);
            conn.rs = conn.pst.executeQuery();

            while (conn.rs.next()) {
                int carder_category_id = conn.rs.getInt("carder_category_id");
                int standardized_cadre_id = conn.rs.getInt("standardized_cadre_id");
                String position_title = conn.rs.getString("position_name");
                int basic_pay = conn.rs.getInt("basic_pay");
                pos = new Position(id, carder_category_id, standardized_cadre_id, position_title, basic_pay);
            }
        } catch (SQLException e) {
            Logger.getLogger(PositionDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return pos;

    }

    public List<Position> getPositionBySId(String standard_id) {
        List<Position> positions = new ArrayList<>();

        try {
            String SELECT_ALL_By_CID = "Select * from cadre_positions WHERE standardized_cadre_id='" + standard_id + "'";
            conn.rs = conn.st.executeQuery(SELECT_ALL_By_CID);
            while (conn.rs.next()) {
                Position pos = new Position();
                pos.setId(Integer.parseInt(conn.rs.getString("id")));
                pos.setPosition_title(conn.rs.getString("position_title"));
                positions.add(pos);

            }

        } catch (SQLException ex) {
            Logger.getLogger(ScarderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return positions;
    }

 

}
