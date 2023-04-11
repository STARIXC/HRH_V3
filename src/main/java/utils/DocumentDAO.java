package utils;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Document;

/**
 *
 * @author CBwahyi
 */
public class DocumentDAO {

    private final DatabaseConnection conn;
    IdGen IG = new IdGen();

    public DocumentDAO() {
        conn = new DatabaseConnection();
    }

    public boolean createDocument(Document document) throws SQLException {
        String sql = "REPLACE INTO hrh.documents (docIdentifier,employee_id, document_id, document_value, created_by) VALUES (?,?,?,?,?)";
        conn.pst = conn.conn.prepareStatement(sql);
        conn.pst.setString(1, document.getDocID());
        conn.pst.setString(2, document.getEmployeeId());
        conn.pst.setInt(3, document.getDocumentId());
        conn.pst.setString(4, document.getDocumentValue());
        conn.pst.setString(5, document.getCreatedBy());
        conn.pst.executeUpdate();
        return true;
    }

    // Method to get all documents for a given employee from the database
    public List<Document> getAllDocumentsForEmployee(String employeeId) throws SQLException {
        List<Document> documents = new ArrayList<>();
        try {
            String sql = "SELECT d.id, e.name, d.document_value FROM documents d INNER JOIN employee_document_type e on e.id=d.document_id WHERE d.employee_id =?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, employeeId);
            conn.rs = conn.pst.executeQuery();

            while (conn.rs.next()) {
                Document document = new Document();
                document.setId(conn.rs.getInt("id"));
                document.setDocumentValue(conn.rs.getString("document_value"));
                document.setDocTypeName(conn.rs.getString("name"));
                documents.add(document);
            }
        } catch (SQLException e) {
            throw new SQLException("Error retrieving documents for employee with ID " + employeeId, e);

//        Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return documents;
    }

    public Document getDocument(String empNo, int id) throws SQLException {
        Document document = null;
        try {
            String query = "SELECT * FROM documents WHERE employee_id = ? AND id = ?";
            conn.pst = conn.conn.prepareStatement(query);
            conn.pst.setString(1, empNo);
            conn.pst.setInt(2, id);
            conn.rs = conn.pst.executeQuery();

            if (conn.rs.next()) {
                int doc_id = conn.rs.getInt("id");
                String docIdentifier = conn.rs.getString("docIdentifier");
                String emp_no = conn.rs.getString("employee_id");
                int docID = conn.rs.getInt("document_id");
                String docValue = conn.rs.getString("document_value");
                String creator = conn.rs.getString("created_by");
                document = new Document();
                document.setId(doc_id);
                document.setDocID(docIdentifier);
                document.setEmployeeId(emp_no);
                document.setDocumentId(docID);
                document.setDocumentValue(docValue);
                document.setCreatedBy(creator);
                       }
        } catch (SQLException e) {
            throw new SQLException("Error retrieving documents for employee with ID " + id, e);
        }

        return document;
    }

}
