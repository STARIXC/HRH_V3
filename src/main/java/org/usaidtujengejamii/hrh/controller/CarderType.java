/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.usaidtujengejamii.hrh.controller;

import utils.CarderTypeDAO;
import utils.JSONConverter;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author UTJ
 */
public class CarderType extends HttpServlet {

    HttpSession session = null;

    private static final long serialVersionUID = 1L;
    Gson gson = new Gson();
    public JSONConverter json;
    public CarderTypeDAO dao;
    PrintWriter out;

    public CarderType() {
        super();
        dao = new CarderTypeDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        // String emp_no = request.getParameter("emp_no");
        if (action.equalsIgnoreCase("save_carder")) {
            models.CarderType ctype = new models.CarderType();
            ctype.setCadre_type_name(request.getParameter("carder_name"));
            ctype.setHrs_per_week(request.getParameter("hrs_per_week"));
            String id = request.getParameter("id");
            if (id == null || id.isEmpty()) {
                dao.addCarderType(ctype);
            } else {
                ctype.setId(Integer.parseInt(id));
                dao.updateCarderType(ctype);
            }

        } else if (action.equalsIgnoreCase("update_carder")) {

        } else {
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
