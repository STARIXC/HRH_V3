/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.usaidtujengejamii.hrh.controller;

import utils.CarderCatDAO;
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
public class CarderCat extends HttpServlet {

    HttpSession session = null;
    Gson gson = new Gson();
    public JSONConverter json;
    public CarderCatDAO dao;
    PrintWriter out;
    int status = 0;

    public CarderCat() {
        super();
        dao = new CarderCatDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        String action = request.getParameter("action");
        String id = request.getParameter("id");

        if (action.equalsIgnoreCase("save_carder_cat")) {

            models.CarderCat ccat = new models.CarderCat();
            String cadre_category_name = request.getParameter("carder_category_name");

            ccat.setCadre_category_name(cadre_category_name);

            if (id == null || id.isEmpty()) {
                dao.addCarderCat(ccat);
            } else {
                ccat.setId(Integer.parseInt(id));
                dao.updateCarderCat(ccat);
            }
        } else {
            String ccate = json.convert(dao.getAllCarderCat());
//            System.out.println(ccate);
            out.println(ccate);
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
