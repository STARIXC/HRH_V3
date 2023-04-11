
package models;

/**
 *
 * @author CBwahyi
 */
public class Document {

    private int id;
    private String employeeId;
    private String DocTypeName;
    private String docID;
    private int documentId;
    private String documentValue;
    private String createdBy;

    public Document() {
     
    }

//    public Document(int id,String docID,  String employeeId, int documentId, String documentValue, String createdBy) {
//        this.id = id;
//        this.employeeId = employeeId;
//                this.docID = docID;
//        this.documentId = documentId;
//        this.documentValue = documentValue;
//        this.createdBy = createdBy;
//    }

    
    
    // Getters and setters for the fields
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    public int getDocumentId() {
        return documentId;
    }

    public void setDocumentId(int documentId) {
        this.documentId = documentId;
    }

    public String getDocumentValue() {
        return documentValue;
    }

    public void setDocumentValue(String documentValue) {
        this.documentValue = documentValue;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getDocTypeName() {
        return DocTypeName;
    }

    public void setDocTypeName(String DocTypeName) {
        this.DocTypeName = DocTypeName;
    }

    public String getDocID() {
        return docID;
    }

    public void setDocID(String docID) {
        this.docID = docID;
    }
    
    
    
    
}
