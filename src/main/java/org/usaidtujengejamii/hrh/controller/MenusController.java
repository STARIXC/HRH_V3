/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.usaidtujengejamii.hrh.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Menu;

import org.json.simple.JSONObject;
import utils.JSONConverter;
import utils.MenuDAO;

/**
 *
 * @author CBwahyi
 */
public class MenusController extends HttpServlet {

    HttpSession session = null;
    Gson gson = new Gson();
    public JSONConverter json;
    public final MenuDAO dao;
    PrintWriter out;
    int status = 0;
    JSONObject obj = new JSONObject();

    public MenusController() {
        super();
        dao = new MenuDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        String deleteId = request.getParameter("deleteId");

        if (action.equalsIgnoreCase("save_role")) {

        } else if (action.equalsIgnoreCase("update_role")) {
//            String id = request.getParameter("role_id");
//            int role_id = Integer.parseInt(id);
//
//            dao.updateRole(role_id, role_name);
        } else if (action.equalsIgnoreCase("all")) {
//            String role = json.convert(dao.getAllRoles());
//            System.out.println(role);
//            out.println(role);
        } else if (action.equalsIgnoreCase("get_menu_by_role")) {
            String id = request.getParameter("id");
            System.out.println("Menu ID:" + id);
            int menu_id = Integer.parseInt(id);
            System.out.println("Converted to ID:" + menu_id);
//            List<Menu> menus= dao.getMenuData(menu_id);

            List<Menu> all_menu_by_id = dao.getMenuData(menu_id);
            String result_ = JSONConverter.convert(all_menu_by_id);
            out.println(result_);
//            String details = JSONConverter.convert(menus);
//            System.out.print(menus);
//            out.println(details);
        } else {
//            String role = json.convert(dao.getAllRoles());
//            System.out.println(role);
//            out.println(role);
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
