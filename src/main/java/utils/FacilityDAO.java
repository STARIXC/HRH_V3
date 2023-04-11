package utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Facility;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;

/**
 *
 * @author CBwahyi
 */
public class FacilityDAO {

    private final DatabaseConnection conn;
    public static final String SELECT_ALL_S = "Select * from district ";

    public FacilityDAO() {
       conn = new DatabaseConnection();
    }
 public List<Facility> getFacilityByCountyId(String DistrictID) {
        List<Facility> facilites = new ArrayList<>();
        try {
            String SELECT_ALL_By_CID = "select DistrictID,CentreSanteId,SubPartnerID,SubPartnerNom from subpartnera where DistrictID='"+DistrictID+"' and active =1 order by SubPartnerNom";
            conn.rs = conn.st.executeQuery(SELECT_ALL_By_CID);
            while (conn.rs.next()) {
                Facility facility = new Facility();
                facility.setDistrictID(Integer.parseInt(conn.rs.getString("DistrictID")));
                facility.setCentreSanteId(Integer.parseInt(conn.rs.getString("CentreSanteId")));
                facility.setSubPartnerNom(conn.rs.getString("SubPartnerNom"));
                facility.setSubPartnerID(Integer.parseInt(conn.rs.getString("SubPartnerID")));
                facilites.add(facility);

            }

        } catch (SQLException ex) {
            Logger.getLogger(FacilityDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return facilites;
    }
}
