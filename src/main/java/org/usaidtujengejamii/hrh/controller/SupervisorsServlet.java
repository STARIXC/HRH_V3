/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.usaidtujengejamii.hrh.controller;


import utils.JSONConverter;
import utils.SupervisorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.FacilitySupervisors;

/**
 *
 * @author UTJ
 */
public class SupervisorsServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;
    HttpSession session = null;
    PrintWriter out;
    public JSONConverter json;
    public SupervisorDAO dao;

    public SupervisorsServlet() {
        super();
        dao = new SupervisorDAO();
    }
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    out = response.getWriter();
        // Get the mflcode of the selected facility
    String mflcode = request.getParameter("mflcode");
    
    // Get the supervisors for the selected facility
    List<FacilitySupervisors> supervisors = dao.getSupervisors(mflcode);
     // Convert the list of supervisors to a JSON string
    String supervisorsJSON = json.convert(supervisors);
        System.out.println(supervisorsJSON);
        out.println(supervisorsJSON);
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
        processRequest(request, response);
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
        processRequest(request, response);
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