
package utils;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.RoleModel;

/**
 *
 * @author Starixc
 */
public class RoleDAO {

    private final DatabaseConnection conn;
    public static final String INSERT_ROLE = "REPLACE INTO tbl_roles(role_name) VALUES (?)";
    public static final String DELETE_ROLE = "DELETE FROM tbl_roles WHERE role_id= ?";
    public static final String UPDATE_ROLE = "UPDATE tbl_roles SET role_name = ? WHERE role_id= ?";
    public static final String SELECT_ALL_ROLES = "SELECT * FROM hrh.tbl_roles";

    public RoleDAO() {
        conn = new DatabaseConnection();
    }

    public List<RoleModel> getAllRoles() {
        List<RoleModel> roles = new ArrayList<>();
        try {
            String sql = "SELECT * FROM tbl_roles";
            conn.rs = conn.st.executeQuery(sql);

            while (conn.rs.next()) {

                int _id = conn.rs.getInt("role_id");
                String _name = conn.rs.getString("role_name");
                RoleModel rl = new RoleModel(_id, _name);
                roles.add(rl);

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
             Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return roles;
    }

    public void addRole(String carder_category_name) {
        try {
            conn.pst = conn.conn.prepareStatement(INSERT_ROLE);
            conn.pst.setString(1, carder_category_name);

            conn.pst.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void updateRole(int ccat_id, String tbl_roles_name) {

        try {
            conn.pst = conn.conn.prepareStatement(UPDATE_ROLE);
            conn.pst.setString(1, tbl_roles_name);
            conn.pst.setInt(2, ccat_id);
            conn.pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public RoleModel getRoleById(int role_id) {
        RoleModel role = new RoleModel();
        try {
            String SELECT_ROLE_ID = "SELECT * from tbl_roles where role_id='" + role_id + "'";
            conn.rs = conn.st.executeQuery(SELECT_ROLE_ID);
            while (conn.rs.next()) {
                role.setId(conn.rs.getInt("role_id"));
                role.setRole_name(conn.rs.getString("role_name"));

            }

        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return role;
    }

}
