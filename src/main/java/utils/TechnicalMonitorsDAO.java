/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.TechnicalMonitor;

/**
 *
 * @author CBwahyi
 */
public class TechnicalMonitorsDAO {

    private final DatabaseConnection conn;

    public TechnicalMonitorsDAO() {
        conn = new DatabaseConnection();
    }

    public List<TechnicalMonitor> getAllTechnicalMonitors() {
        List<TechnicalMonitor> technicalMonitors = new ArrayList<>();
        try {
            String sql = "SELECT * FROM technical_monitors where active=1";

            conn.rs = conn.st.executeQuery(sql);

            while (conn.rs.next()) {
                TechnicalMonitor technicalMonitor = new TechnicalMonitor();
                technicalMonitor.setTechnicalMonitorId(conn.rs.getInt("technical_monitor_id"));
                technicalMonitor.setName(conn.rs.getString("name"));
                technicalMonitor.setEmail(conn.rs.getString("email"));
                technicalMonitor.setMdtRegion(conn.rs.getInt("mdtregion"));
                technicalMonitors.add(technicalMonitor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return technicalMonitors;
    }

    public String getTechnicalMonitorEmail(int technicalMonitorId) {
        String email = null;
        try {
            String sql = "SELECT email FROM technical_monitors WHERE technical_monitor_id=?";

            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setInt(1, technicalMonitorId);
            conn.rs = conn.pst.executeQuery();
            if (conn.rs.next()) {
                email = conn.rs.getString("email");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return email;
    }

}
