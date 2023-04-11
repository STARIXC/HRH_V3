package utils;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.EmployeeDocumentType;

/**
 *
 * @author CBwahyi
 */
public class EmployeeDocumentTypeDAO {

    private final DatabaseConnection conn;

    public EmployeeDocumentTypeDAO() {
        conn = new DatabaseConnection();
    }

    public List<EmployeeDocumentType> getAll() throws SQLException {
        List<EmployeeDocumentType> documentTypes = new ArrayList<>();
        try {
            String sql = "SELECT * FROM employee_document_type";
            conn.rs = conn.st.executeQuery(sql);

            while (conn.rs.next()) {
                EmployeeDocumentType documentType = new EmployeeDocumentType();
                documentType.setId(conn.rs.getInt("id"));
                documentType.setName(conn.rs.getString("name"));
                documentType.setDescription(conn.rs.getString("description_"));
                documentType.setIsRequired(conn.rs.getString("is_required"));
                documentTypes.add(documentType);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(EmployeeDocumentTypeDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return documentTypes;
    }

    public EmployeeDocumentType getById(int id) throws SQLException {

        EmployeeDocumentType employeeDocumentType = new EmployeeDocumentType();
        try {
            String sql = "SELECT * FROM hrh.employee_document_type where id= ?";
//            conn.rs = conn.st.executeQuery(sql);
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setInt(1, id);
            conn.rs = conn.pst.executeQuery();
            if (conn.rs.next()) {

                employeeDocumentType.setId(conn.rs.getInt("id"));
                employeeDocumentType.setName(conn.rs.getString("name"));
                employeeDocumentType.setDescription(conn.rs.getString("description_"));
                employeeDocumentType.setIsRequired(conn.rs.getString("is_required"));

            } else {
                return null;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(EmployeeDocumentTypeDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return employeeDocumentType;
    }

    public void insert(EmployeeDocumentType documentType) throws SQLException {

        try {
            String sql = "INSERT INTO employee_document_type (name, description_, is_required) VALUES (?, ?, ?)";
            conn.pst = conn.conn.prepareStatement(sql);

            conn.pst.setString(1, documentType.getName());
            conn.pst.setString(2, documentType.getDescription());
            conn.pst.setString(3, documentType.getIsRequired());
            conn.pst.executeUpdate();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(EmployeeDocumentTypeDAO.class
                    .getName()).log(Level.SEVERE, null, e);
        }
    }

    public void update(EmployeeDocumentType documentType) throws SQLException {

        try {
            String sql = "UPDATE employee_document_type SET name=?, description_=?, is_required=? WHERE id=?";
            conn.pst = conn.conn.prepareStatement(sql);

            conn.pst.setString(1, documentType.getName());
            conn.pst.setString(2, documentType.getDescription());
            conn.pst.setString(3, documentType.getIsRequired());
            conn.pst.setInt(4, documentType.getId());
            conn.pst.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(EmployeeDocumentTypeDAO.class
                    .getName()).log(Level.SEVERE, null, e);
        }
    }

    public void delete(int id) throws SQLException {

        try {
            String sql = "DELETE FROM employee_document_type WHERE id=?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setInt(1, id);
            conn.pst.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(EmployeeDocumentTypeDAO.class
                    .getName()).log(Level.SEVERE, null, e);
        }
    }

}
