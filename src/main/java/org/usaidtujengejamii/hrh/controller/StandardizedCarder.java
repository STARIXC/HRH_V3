package org.usaidtujengejamii.hrh.controller;

import utils.JSONConverter;
import utils.ScarderDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.StandardCarder;
import org.json.simple.JSONObject;

/**
 *
 * @author UTJ
 */
public class StandardizedCarder extends HttpServlet {

    HttpSession session = null;
    Gson gson = new Gson();
    public JSONConverter json;
    public ScarderDAO dao;
    PrintWriter out;
    int status = 0;

    public StandardizedCarder() {
        super();
        dao = new ScarderDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        String action = request.getParameter("action");
        String deleteId = request.getParameter("deleteId");
        if (action.equalsIgnoreCase("delete")) {

            int cat_type_id = Integer.parseInt(deleteId);
//            System.out.println(cat_type_id);
            status = dao.deleteStandardCarder(cat_type_id);
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
            String carder_id = request.getParameter("carder_id");
            int id = Integer.parseInt(carder_id);
            StandardCarder ccat = dao.getStandardCarderById(id);
            String result = JSONConverter.convert(ccat);
            out.println(result);

        } else if (action.equalsIgnoreCase("process_Scarder")) {

            StandardCarder ccat = new StandardCarder();
            String standardized_cadre_name = request.getParameter("standardized_cadre_name");
            String carder_category_id = request.getParameter("carder_category_id");
            String emp_type = request.getParameter("emp_type");

            String id = request.getParameter("e_standard_category_id");

            if (id == null || id.isEmpty()) {
                ccat.setCarder_category_id(Integer.parseInt(carder_category_id));
                ccat.setStandardized_cadre_name(standardized_cadre_name);
                ccat.setEmp_type(Integer.parseInt(emp_type));
                dao.addStandardCarder(ccat);
            } else {
                ccat.setId(Integer.parseInt(id));
                ccat.setCarder_category_id(Integer.parseInt(carder_category_id));
                ccat.setStandardized_cadre_name(standardized_cadre_name);
                ccat.setEmp_type(Integer.parseInt(emp_type));
//                System.out.println(ccat);
                dao.updateStandardCarder(ccat);
            }
        } else {
            String ccate = json.convert(dao.getAllStandardCarder());
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
