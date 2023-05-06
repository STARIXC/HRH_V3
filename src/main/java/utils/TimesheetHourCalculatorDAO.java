package utils;

import java.sql.SQLException;
import java.time.LocalDate;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;

/**
 *
 * @author CBwahyi
 */
public class TimesheetHourCalculatorDAO {

    private final DatabaseConnection conn;

    public TimesheetHourCalculatorDAO() {
        conn = new DatabaseConnection();
    }

    public String totalHours(String year, String month) {
        String hours = "";
        try {
            LocalDate startDate = LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), 26).minusMonths(1);
            LocalDate endDate = LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), 25);
            String query = "SELECT SUM(workingHours) AS expectedHours FROM `hrh`.`calendar_table` WHERE dt BETWEEN ? AND ?  AND   isWeekday=1 AND isHoliday=0";
//            conn.rs = conn.st.executeQuery();
            // Prepare the statement and set the parameters
            conn.pst = conn.conn.prepareStatement(query);

            conn.pst.setString(1, startDate.toString());
            conn.pst.setString(2, endDate.toString());

            // Execute the query and process the results
            conn.rs = conn.pst.executeQuery();
            while (conn.rs.next()) {
                hours = conn.rs.getString("expectedHours");

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return hours;
    }
}
