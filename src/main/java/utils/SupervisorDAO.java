package utils;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.FacilitySupervisors;

/**
 *
 * @author Cbwahyi
 */
public class SupervisorDAO {

    private final DatabaseConnection conn;

    public SupervisorDAO() {
        conn = new DatabaseConnection();
    }

    public  List<FacilitySupervisors> getSupervisors(String mflcode) {

        try {
            String SELECT_ALL_MFL= "SELECT supervisor_id, name FROM tbl_facility_supervisor WHERE mflc = '" + mflcode + "'";
            conn.rs=conn.st.executeQuery(SELECT_ALL_MFL);
         
            // Store the supervisors in a list
            List<FacilitySupervisors> supervisors = new ArrayList<>();
            while (conn.rs.next()) {
                supervisors.add(new FacilitySupervisors(
                        conn.rs.getInt("supervisor_id"),
                        conn.rs.getString("name")
                ));
            }

            return supervisors;
        } catch (SQLException e) {
            // Log the error and return an empty list
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

}
