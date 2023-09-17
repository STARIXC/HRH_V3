package utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Menu;
import models.MenuModule;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;

/**
 *
 * @author CBwahyi
 */
public class MenuModuleDAO {

    private static final Logger LOGGER = Logger.getLogger(MenuModuleDAO.class.getName());
    private final DatabaseConnection conn;
    public static final String GET_MODULES = "SELECT * from modules";

    public MenuModuleDAO() {
        conn = new DatabaseConnection();
    }

    public List<MenuModule> getModulesData() {
        List<MenuModule> modules = new ArrayList<>();
        try {

            conn.pst = conn.conn.prepareStatement(GET_MODULES);
            conn.rs = conn.pst.executeQuery();

            while (conn.rs.next()) {
                MenuModule module = new MenuModule();

                module.setId(conn.rs.getInt("id"));
                module.setName(conn.rs.getString("name"));
                module.setIconClass(conn.rs.getString("icon_class"));

                modules.add(module);
            }

            return modules;
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error while executing query", ex);
        }
        return null; // User not found or an error occurred
    }

}
