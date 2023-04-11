package org.usaidtujengejamii.hrh.controller;

import utils.IdGen;
import utils.JSONConverter;
import com.google.gson.Gson;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Common__;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;

/**
 *
 * @author CBwahyi
 */
public class EmployeeConfig extends HttpServlet {

    HttpSession session;
    String found;
    MessageDigest m;
    PrintWriter out;
    private final DatabaseConnection conn;

    public JSONConverter json;
    JSONObject obj = new JSONObject();
    JSONArray arr = new JSONArray();
    Gson gson = new Gson();
    String result, nextPage, documentTypeName, documentDescription, statusName, statusDescription, qualificationName, qualificationDescription, docQuery;
    int docID, statusID, qualificationID = 0;
    String SELECT_ALL_DOC = "SELECT d.id as docID ,d.name as doc_name,d.description_ as doc_description_,d.created_at as created_at_ FROM hrh.employee_document_type d";

    public EmployeeConfig() {
        conn = new DatabaseConnection();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        session = request.getSession();

        IdGen IG = new IdGen();//create globally JSONObject and name is "obj"
        result = nextPage = documentTypeName = documentDescription = statusName = statusDescription = qualificationName = qualificationDescription = docQuery = "";
        String action = request.getParameter("action");
        documentTypeName = request.getParameter("documentTypeName");
        documentDescription = request.getParameter("documentDescription");
        

        if (action.equalsIgnoreCase("deleteDocument")) {
            String deleteDocId_ = request.getParameter("deleteDocId");
            int deleteDocId = Integer.parseInt(deleteDocId_);
            int deleted = deletebio(deleteDocId);
            if (deleted > 0) {

                obj.put("status", "success");
                obj.put("message", "Staff Records deleted successfull");    //create json object "status","message" and apply custome messages for "delete data"

            } else {
                obj.put("status", "error");
                obj.put("message", "Unable To Delete the Record....");    //create json object "status","message" and apply custome messages for "delete data"
            }
            out.print(obj);

        } else if (action.equalsIgnoreCase("saveDocType")) {
            String id = request.getParameter("documentID");

            if (id == null || id.isEmpty()) {
                int addDocType = addDocumentType(documentTypeName, documentDescription);
                if (addDocType > 0) {
                    obj.put("status", "success");
                    obj.put("message", "Record for" + documentTypeName + "Added Successfully");    //create json object "status","message" and apply custome messages for "delete data"
                } else {
                    obj.put("status", "error");
                    obj.put("message", "Unable to add " + documentTypeName + " To the Record....");   //create json object "status","message" and apply custome messages for "unable to delete data"
                }
                out.print(obj);
            } else {
                docID = Integer.parseInt(id);
                int updateDocType = updateDocumentType(docID, documentTypeName, documentDescription);
                if (updateDocType > 0) {
                    obj.put("status", "success");
                    obj.put("message", "Record for" + documentTypeName + "updated Successfully");    //create json object "status","message" and apply custome messages for "delete data"
                } else {
                    obj.put("status", "error");
                    obj.put("message", "Unable to update " + documentTypeName + " To the Record....");   //create json object "status","message" and apply custome messages for "unable to delete data"
                }
                out.print(obj);
            }

        } else if (action.equalsIgnoreCase("get_all_docs")) {
            String documentTypes = JSONConverter.convert(getAllDoc());
            out.println(documentTypes);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeConfig.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeConfig.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private int deletebio(int deleteDocId) throws SQLException {
        int deleted = 0;
        String delete = "DELETE FROM `hrh`.`employee_document_type` WHERE id='" + deleteDocId + "'";
        conn.pst = conn.conn.prepareStatement(delete);
        if (conn.pst.executeUpdate() > 0) {
            deleted += 1;
        } else {
            deleted = 0;
        }
        return deleted;
    }

    private int addDocumentType(String documentTypeName, String documentDescription) throws SQLException {
        int success = 0;

        docQuery = "REPLACE INTO `hrh`.`employee_document_type (name,description_)VALUES(?,?)";

        conn.pst = conn.conn.prepareStatement(docQuery);
        conn.pst.setString(1, documentTypeName);
        conn.pst.setString(2, documentDescription);

        conn.pst = conn.conn.prepareStatement(docQuery);

        if (conn.pst.executeUpdate() > 0) {
            success += 1;
        } else {
            success = 0;
        }

        return success;
    }

    private int updateDocumentType(int docID, String documentTypeName, String documentDescription) throws SQLException {
        int success = 0;

        docQuery = "REPLACE INTO `hrh`.`employee_document_type (id,name,description_)VALUES(?,?,?)";

        conn.pst = conn.conn.prepareStatement(docQuery);
        conn.pst.setInt(1, docID);
        conn.pst.setString(2, documentTypeName);
        conn.pst.setString(3, documentDescription);

        conn.pst = conn.conn.prepareStatement(docQuery);

        if (conn.pst.executeUpdate() > 0) {
            success += 1;
        } else {
            success = 0;
        }

        return success;
    }

    private List<Common__> getAllDoc() {
        List<Common__> docs = new ArrayList<>();
        try {

            conn.rs = conn.st.executeQuery(SELECT_ALL_DOC);

            while (conn.rs.next()) {

                int _id = conn.rs.getInt("docID");
                String _name = conn.rs.getString("doc_name");
                String _desc = conn.rs.getString("doc_description_");
                String _created = conn.rs.getString("created_at_");
                Common__ comm = new Common__(_id, _name, _desc, _created);
                docs.add(comm);

            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        System.out.println(docs);
        return docs;
    }
}
