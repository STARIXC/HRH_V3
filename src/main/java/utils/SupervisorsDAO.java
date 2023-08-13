package utils;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Supervisor;

/**
 *
 * @author Cbwahyi
 */
public class SupervisorsDAO {

    private final DatabaseConnection conn;

    public SupervisorsDAO() {
        conn = new DatabaseConnection();
    }

    public  List<Supervisor> getSupervisors() {
         List<Supervisor> supervisors = new ArrayList<>();
        try {
            String SELECT_ALL_MFL= "SELECT s.* ,f.SubPartnerNom, fs.mflc FROM hrh.supervisors s"
                    + " join tbl_facility_supervisor fs on fs.supervisor_id =s.id"
                    + " join subpartnera f on f.CentreSanteId=fs.mflc where s.status=1";
            conn.rs=conn.st.executeQuery(SELECT_ALL_MFL);
         
            // Store the supervisors in a list
           
             while (conn.rs.next()) {
                Supervisor supervisor = new Supervisor();
                supervisor.setId(conn.rs.getInt("id"));
                supervisor.setName(conn.rs.getString("name"));
                supervisor.setEmail(conn.rs.getString("email"));
                supervisors.add(supervisor);
            }

            return supervisors;
        } catch (SQLException e) {
            // Log the error and return an empty list
            e.printStackTrace();
          
        }
        return supervisors;
    }
    
      public String getSupervisorEmail(int supervisorId) {
        String email = null;
        try {
            String sql="SELECT email FROM hrh.supervisors WHERE id=?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setInt(1, supervisorId);
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
