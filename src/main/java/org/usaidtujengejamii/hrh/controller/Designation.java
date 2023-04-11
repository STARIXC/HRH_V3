/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.usaidtujengejamii.hrh.controller;

import utils.JSONConverter;
import utils.PositionDAO;
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
import models.Position;
import org.json.simple.JSONObject;

/**
 *
 * @author UTJ
 */
public class Designation extends HttpServlet {

    HttpSession session = null;
    Gson gson = new Gson();
    public JSONConverter json;
    public PositionDAO dao;
    PrintWriter out;
    int status = 0;
 
    public Designation(){
    dao = new PositionDAO();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
     
        String action = request.getParameter("action");
          response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
           String deleteId = request.getParameter("deleteId");
        if (action.equalsIgnoreCase("delete")) {
            int pos_id = Integer.parseInt(deleteId);
            System.out.println(pos_id);
            status = dao.deletePosition(pos_id);
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
            String carder_id = request.getParameter("designation_id");
            int id = Integer.parseInt(carder_id);
            Position pos = dao.getPositionById(id);
            String result = JSONConverter.convert(pos);
            out.println(result);

        } else if (action.equalsIgnoreCase("process_Designation")) {
            Position pos = new Position();
            String carder_category_id = request.getParameter("carder_category_id");
            String standardized_cadre_id = request.getParameter("standardized_cadre_id");
            String position_title = request.getParameter("position_title");
            String basic_pay = request.getParameter("basic_pay");
            String id = request.getParameter("e_position_id");

            if (id == null || id.isEmpty()) {
                pos.setCarder_category_id(Integer.parseInt(carder_category_id));
                pos.setStandardized_cadre_id(Integer.parseInt(standardized_cadre_id));
                pos.setPosition_title(position_title);
//                pos.setCadre_type_id(Integer.parseInt(cadre_type_id));
                pos.setBasic_pay(Integer.parseInt(basic_pay));
                 System.out.println(pos);
//                
  status = dao.addPosition(pos);
            JSONObject obj = new JSONObject();   //create globally JSONObject and name is "obj"

            if (status != 0) {   //check if condition variable "i" not equal to zero after continue

                obj.put("status", "success");
                obj.put("message", "Record Added Successfully");    //create json object "status","message" and apply custome messages for "delete data"
                System.out.println(obj);
            } else {

                obj.put("status", "error");
                obj.put("message", "Unable to Add Record");   //create json object "status","message" and apply custome messages for "unable to delete data"
                System.out.println(obj);
            }

            out.print(obj); //finally print the "obj" object
            } else {
                pos.setId(Integer.parseInt(id));
                pos.setCarder_category_id(Integer.parseInt(carder_category_id));
                pos.setStandardized_cadre_id(Integer.parseInt(standardized_cadre_id));
                pos.setPosition_title(position_title);
//                pos.setCadre_type_id(Integer.parseInt(cadre_type_id));
                pos.setBasic_pay(Integer.parseInt(basic_pay));
                
//                
 status = dao.updatePosition(pos);
            JSONObject obj = new JSONObject();   //create globally JSONObject and name is "obj"

            if (status != 0) {   //check if condition variable "i" not equal to zero after continue

                obj.put("status", "success");
                obj.put("message", "Record Added Successfully");    //create json object "status","message" and apply custome messages for "delete data"
                System.out.println(obj);
            } else {

                obj.put("status", "error");
                obj.put("message", "Unable to Add Record");   //create json object "status","message" and apply custome messages for "unable to delete data"
                System.out.println(obj);
            }

            out.print(obj); //finally print the "obj" object

            }
        } else {
//            String ccate = json.convert(
//                    dao.getAllStandardCarder()
//            );
//            System.out.println(ccate);
//            out.println(ccate);
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
            Logger.getLogger(Designation.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Designation.class.getName()).log(Level.SEVERE, null, ex);
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
