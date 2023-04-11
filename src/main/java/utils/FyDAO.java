package utils;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.FY;

/**
 *
 * @author UTJ
 */
public class FyDAO {

    private final DatabaseConnection conn;
    public static final String SELECT_ALL_ = "SELECT * FROM hrh.tbl_financial_year where status =1";

    public FyDAO() {
        conn = new DatabaseConnection();
    }

    public List<FY> getAllFY() {
        List<FY> Fyear = new ArrayList<>();

        try {
            conn.rs = conn.st.executeQuery(SELECT_ALL_);
            while (conn.rs.next()) {
                FY fy = new FY();
                fy.setId(Integer.parseInt(conn.rs.getString("id")));
                fy.setName(conn.rs.getString("name"));
                fy.setYear(conn.rs.getString("year"));
                fy.setStart_date(conn.rs.getString("start_date"));
                fy.setEnd_date(conn.rs.getString("end_date"));
                fy.setContract_period(conn.rs.getString("contract_period"));
                fy.setContract_no_months(conn.rs.getString("contract_no_months"));

                Fyear.add(fy);
            }
        } catch (SQLException e) {
            Logger.getLogger(FyDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        //System.out.print(positions);
        return Fyear;
    }

    public FY geFYById(int id) {
        FY fy = new FY();
        try {
            String SELECT_FY_ID = "SELECT * from tbl_financial_year where id='" + id + "'";
            conn.rs = conn.st.executeQuery(SELECT_FY_ID);
            while (conn.rs.next()) {
                fy.setId(Integer.parseInt(conn.rs.getString("id")));
                fy.setName(conn.rs.getString("name"));
                fy.setYear(conn.rs.getString("year"));
                fy.setStart_date(conn.rs.getString("start_date"));
                fy.setEnd_date(conn.rs.getString("end_date"));
                fy.setContract_period(conn.rs.getString("contract_period"));
                fy.setContract_no_months(conn.rs.getString("contract_no_months"));

            }

        } catch (SQLException ex) {
            Logger.getLogger(FyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fy;
    }

}
