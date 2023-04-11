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
import models.CarderType;
import org.json.simple.JSONObject;

/**
 *
 * @author STARIXC
 */
public class CarderTypeUpdates extends HttpServlet {

    HttpSession session = null;
    Gson gson = new Gson();
    public JSONConverter json;
    public CarderTypeDAO dao;
    PrintWriter out;
    int status=0;
    public CarderTypeUpdates() {
        super();
        dao = new CarderTypeDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        String action = request.getParameter("action");
        //String id = request.getParameter("carder_type_id");
        String deleteId = request.getParameter("deleteId");
        if (action.equalsIgnoreCase("delete")) {

            int cat_type_id = Integer.parseInt(deleteId);
            System.out.println(cat_type_id);
            status = dao.deleteCtype(cat_type_id);
            JSONObject obj = new JSONObject();   //create globally JSONObject and name is "obj"

            if (status != 0) {   //check if condition variable "i" not equal to zero after continue

                obj.put("status", "success");
                obj.put("message", "Leave Type Delete Successfully");    //create json object "status","message" and apply custome messages for "delete data"
            } else {

                obj.put("status", "error");
                obj.put("message", "Unable to delete Leave Type....");   //create json object "status","message" and apply custome messages for "unable to delete data"
            }

            out.print(obj); //finally print the "obj" object

        } else if (action.equalsIgnoreCase("edit")) {
            String ctype_id = request.getParameter("carder_id");
            int id = Integer.parseInt(ctype_id);
            CarderType ctype = dao.getCarderTypeById(id);
            String result = JSONConverter.convert(ctype);
            out.println(result);

        } else if (action.equalsIgnoreCase("update_carder")) {

            CarderType ctype = new CarderType();
            ctype.setCadre_type_name(request.getParameter("e_carder_name"));
            ctype.setHrs_per_week(request.getParameter("e_hrs_per_week"));
            String id = request.getParameter("e_carder_id");
            if (id == null || id.isEmpty()) {
                dao.addCarderType(ctype);
            } else {
                ctype.setId(Integer.parseInt(id));
                dao.updateCarderType(ctype);
            }
        } else {
            String ctype = json.convert(dao.getAllCarderType());
            System.out.println(ctype);
            out.println(ctype);
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
