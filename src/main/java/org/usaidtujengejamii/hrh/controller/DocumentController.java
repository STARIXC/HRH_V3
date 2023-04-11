/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.usaidtujengejamii.hrh.controller;

import utils.EmployeeDocumentTypeDAO;
import utils.JSONConverter;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.EmployeeDocumentType;

/**
 *
 * @author UTJ
 */
public class DocumentController extends HttpServlet {

    private final EmployeeDocumentTypeDAO dao;
    HttpSession session = null;
    Gson gson = new Gson();
    public JSONConverter json;
    PrintWriter out;
    int status = 0;
  

    public DocumentController() {
        super();
        dao = new EmployeeDocumentTypeDAO();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occ
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        String action = request.getParameter("action");
        

        String name = request.getParameter("name");
        String description = request.getParameter("description_");
        String isRequired = request.getParameter("is_required");

        if (action.equalsIgnoreCase("delete")) {
            String id_ = request.getParameter("deleteId");
            int id = Integer.parseInt(id_);
            dao.delete(id);
        } else if (action.equalsIgnoreCase("add_doc_type")) {
            String id_ = request.getParameter("doc_id");
            
            EmployeeDocumentType docType = new EmployeeDocumentType();
            
            docType.setName(name);
            docType.setDescription(description);
            docType.setIsRequired(isRequired);
            System.out.println(docType);
            if (id_ == null || id_.isEmpty()) {
                dao.insert(docType);
            } else {
                docType.setId(Integer.parseInt(id_));
                dao.update(docType);
                
            }

        } else if (action.equalsIgnoreCase("get_docs")) {
            String documentTypes = JSONConverter.convert(dao.getAll());
//            System.out.println(documentTypes);
            out.println(documentTypes);

        } else if (action.equalsIgnoreCase("get_doc")) {
            String id_ = request.getParameter("id");
            int id = Integer.parseInt(id_);
            String documentType = JSONConverter.convert(dao.getById(id));
//            System.out.println(ccate);
            out.println(documentType);

        } else {
            String documentTypes = JSONConverter.convert(dao.getAll());
//            System.out.println(ccate);
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
            Logger.getLogger(DocumentController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DocumentController.class.getName()).log(Level.SEVERE, null, ex);
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

}
