/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Menu;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;

/**
 *
 * @author CBwahyi
 */
public class MenuDAO {

    private static final Logger LOGGER = Logger.getLogger(MenuDAO.class.getName());
    private final DatabaseConnection conn;
    public static final String GET_MENU_BY_ROLE = "SELECT menus.id, menus.name, menus.menu_url, menus.parent_id, menus.module_id "
            + "FROM menus "
            + "INNER JOIN menu_permission ON menu_permission.menu_id = menus.id "
            + "WHERE menu_permission.role_id = ? AND menus.status = 1 AND menus.action IS NULL "
            + "ORDER BY menus.id ASC";

    public MenuDAO() {
        conn = new DatabaseConnection();
    }

    public List<Menu> getMenuData(int roleId) {
        List<Menu> menus = new ArrayList<>();
        try {

            conn.pst = conn.conn.prepareStatement(GET_MENU_BY_ROLE);
            conn.pst.setInt(1, roleId);

            conn.rs = conn.pst.executeQuery();

            while (conn.rs.next()) {
                Menu menu = new Menu();

                menu.setId(conn.rs.getInt("id"));
                menu.setName(conn.rs.getString("name"));
                menu.setMenu_url(conn.rs.getString("menu_url"));
                menu.setParent_id(conn.rs.getInt("parent_id"));
                menu.setModule_id(conn.rs.getInt("module_id"));
                menus.add(menu);
            }

            return menus;
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error while executing query", ex);
        }
        return null; // User not found or an error occurred
    }

}
