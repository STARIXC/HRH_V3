package utils;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.TerminationModel;

/**
 *
 * @author CBWAHYI
 */
public class TerminationDAO {

    private final DatabaseConnection conn;
    private static final String INSERT_TERMINATION = "REPLACE INTO tbl_termination(t_id,emp_no,termination_date,notice_date,termination_reason,voluntary_termination) VALUES (?,?,?,?,?,?);";
    private static final String DELETE_TERMINATION = "DELETE from tbl_termination where t_id=?";
    private static final String UPDATE_TERMINATION = "update tbl_termination set emp_no=?,termination_date=?, notice_date=?,termination_reason=?,voluntary_termination=? where t_id=?";
    private static final String SELECT_ALL_TERMINATION = "SELECT t.t_id as id,t.emp_no as emp_no,"
            + "EmpBio.full_name,t.termination_date as termination_date,"
            + "t.notice_date as notice_date,"
            + "CASE"
            + " WHEN t.voluntary_termination = '1' THEN 'Voluntary Termination'"
            + "                ELSE 'HRH Initiated'"
            + "            END AS  voluntary_termination,"
            + " t.termination_reason as termination_reason FROM tbl_termination t LEFT JOIN (SELECT  CONCAT(ifnull(e.first_name,'' ), ' ',ifnull( e.other_name,'' ), ' ',ifnull( e.surname,'' )  ) AS full_name, e.emp_no FROM emp_bio e GROUP BY e.emp_no) EmpBio ON t.emp_no = EmpBio.emp_no";
    private static final String SELECT_TERMINATION_BY_ID = "SELECT  t.t_id,t.emp_no,  CONCAT(ifnull(e.first_name,'' ), ' ',ifnull( e.other_name,'' ), ' ',ifnull( e.surname,'' )  )as EName,  t.termination_date,  t.notice_date,  t.voluntary_termination, t.termination_reason FROM tbl_termination t JOIN emp_bio e ON e.emp_no=t.emp_no where t_id=?";

    public TerminationDAO() {
        conn = new DatabaseConnection();
    }

    @SuppressWarnings("static-access")
    public void addTermination(TerminationModel terminate) {

        try {

            conn.pst = conn.conn.prepareStatement(INSERT_TERMINATION);
//			declare parameters starting with 1
            conn.pst.setString(1, terminate.getT_id());
            conn.pst.setString(2, terminate.getEmp_no());
            conn.pst.setString(3, terminate.getNotice_date());
            conn.pst.setString(4, terminate.getTermination_date());
            conn.pst.setString(5, terminate.getTermination_reason());
            conn.pst.setString(6, terminate.getVoluntary_termination());
            conn.pst.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(TerminationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @SuppressWarnings("static-access")
    public void deleteTerminationModel(int typeID) {
        try {

            conn.pst = conn.conn.prepareStatement(DELETE_TERMINATION);
            conn.pst.setInt(1, typeID);
            conn.pst.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
Logger.getLogger(TerminationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @SuppressWarnings("static-access")
    public void updateTermination(TerminationModel terminate) {

        try {

            conn.pst = conn.conn.prepareStatement(UPDATE_TERMINATION);
            conn.pst.setString(1, terminate.getT_id());
            conn.pst.setString(2, terminate.getEmp_no());
            conn.pst.setString(3, terminate.getNotice_date());
            conn.pst.setString(4, terminate.getTermination_date());
            conn.pst.setString(5, terminate.getTermination_reason());
            conn.pst.setString(6, terminate.getVoluntary_termination());
            conn.pst.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
Logger.getLogger(TerminationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @SuppressWarnings("static-access")
    public List<TerminationModel> getAllTerminationModels() {
        List<TerminationModel> terminates = new ArrayList<>();
        try {
            conn.rs = conn.st.executeQuery(SELECT_ALL_TERMINATION);
            while (conn.rs.next()) {
                TerminationModel terminate = new TerminationModel();
                terminate.setT_id(conn.rs.getString("id"));
                terminate.setEmp_no(conn.rs.getString("emp_no"));
                terminate.setNotice_date(conn.rs.getString("notice_date"));
                terminate.setTermination_date(conn.rs.getString("termination_date"));
                terminate.setTermination_reason(conn.rs.getString("termination_reason"));
                terminate.setVoluntary_termination(conn.rs.getString("voluntary_termination"));
                terminate.setEmp_name(conn.rs.getString("full_name"));
                terminates.add(terminate);
            }
        } catch (SQLException e) {
            Logger.getLogger(TerminationDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return terminates;
    }

    @SuppressWarnings("static-access")
    public TerminationModel getTerminationModelById(String id) {
        TerminationModel terminate = new TerminationModel();

        try {

            conn.pst = conn.conn.prepareStatement(SELECT_TERMINATION_BY_ID);
            conn.pst.setString(1, id);
            conn.rs = conn.pst.executeQuery();
            if (conn.rs.next()) {
                terminate.setT_id(id);
                terminate.setEmp_no(conn.rs.getString("emp_no"));
                terminate.setNotice_date(conn.rs.getString("notice_date"));
                terminate.setTermination_date(conn.rs.getString("termination_date"));
                terminate.setTermination_reason(conn.rs.getString("termination_reason"));
                terminate.setVoluntary_termination(conn.rs.getString("voluntary_termination"));
                terminate.setEmp_name(conn.rs.getString("Ename"));
            }
        } catch (SQLException e) {
            Logger.getLogger(TerminationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return terminate;

    }

}
