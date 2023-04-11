/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.usaidtujengejamii.hrh.controller;

import utils.CarderCatDAO;
import utils.JSONConverter;
import utils.RoleDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.RoleModel;

/**
 *
 * @author UTJ
 */
public class Roles extends HttpServlet {

    HttpSession session = null;

    Gson gson = new Gson();
    public JSONConverter json;
    public RoleDAO dao;
    PrintWriter out;

    public Roles() {
        super();
        dao = new RoleDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        String action = request.getParameter("action");
        String role_name = request.getParameter("role_name");

        if (action.equalsIgnoreCase("save_role")) {

            dao.addRole(role_name);
        } else if (action.equalsIgnoreCase("update_role")) {
            String id = request.getParameter("role_id");
            int role_id = Integer.parseInt(id);

            dao.updateRole(role_id, role_name);
        } else if (action.equalsIgnoreCase("all")) {
            String role = json.convert(dao.getAllRoles());
            System.out.println(role);
            out.println(role);
        } else if (action.equalsIgnoreCase("edit")) {
            String id = request.getParameter("role_id");
            int role_id = Integer.parseInt(id);
            RoleModel roled = dao.getRoleById(role_id);
            String details = JSONConverter.convert(roled);
            System.out.print(roled);
            out.println(details);
        } else {
            String role = json.convert(dao.getAllRoles());
            System.out.println(role);
            out.println(role);
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
