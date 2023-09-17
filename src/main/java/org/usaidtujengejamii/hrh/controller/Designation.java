package org.usaidtujengejamii.hrh.controller;

import utils.JSONConverter;
import utils.PositionDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
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
    Position pos = new Position();
    PrintWriter out;
    int status = 0;
    JSONObject obj = new JSONObject();

    public Designation() {
        dao = new PositionDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        String action = request.getParameter("action");
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        String deleteId = request.getParameter("deleteId");

        switch (action.toLowerCase()) {
            case "delete":
                int pos_id = Integer.parseInt(deleteId);
                System.out.println(pos_id);
                status = dao.deletePosition(pos_id);
                obj = new JSONObject();

                if (status != 0) {
                    obj.put("status", "success");
                    obj.put("message", "Record Deleted Successfully");
                } else {
                    obj.put("status", "error");
                    obj.put("message", "Unable to delete Record....");
                }

                out.print(obj);
                break;

            case "edit":
                String carder_id = request.getParameter("designation_id");
                int id = Integer.parseInt(carder_id);
                pos = dao.getPositionById(id);
                String result = JSONConverter.convert(pos);
                out.println(result);
                break;
            case "getBySC":
                String scarder_id = request.getParameter("standardCarder");
//                int sid = Integer.parseInt(scarder_id);
               List <Position> scarderPositions = dao.getPositionBySId(scarder_id);
                String result_ = JSONConverter.convert(scarderPositions);
                out.println(result_);
                break;
            case "process_designation":

                String carder_category_id = request.getParameter("carder_category_id");
                String standardized_cadre_id = request.getParameter("standardized_cadre_id");
                String position_title = request.getParameter("position_title");
                String basic_pay = request.getParameter("basic_pay");
                String id_ = request.getParameter("e_designation_id");

                if (id_ == null || id_.isEmpty()) {
                    pos.setCarder_category_id(Integer.parseInt(carder_category_id));
                    pos.setStandardized_cadre_id(Integer.parseInt(standardized_cadre_id));
                    pos.setPosition_title(position_title);
                    pos.setBasic_pay(Integer.parseInt(basic_pay));
                    System.out.println(pos);

                    status = dao.addPosition(pos);

                    if (status != 0) {
                        obj.put("status", "success");
                        obj.put("message", "Record Added Successfully");
                        System.out.println(obj);
                    } else {
                        obj.put("status", "error");
                        obj.put("message", "Unable to Add Record");
                        System.out.println(obj);
                    }

                    out.print(obj);
                } else {
                    // code for updating position
                    pos.setId(Integer.parseInt(id_));
                    pos.setCarder_category_id(Integer.parseInt(carder_category_id));
                    pos.setStandardized_cadre_id(Integer.parseInt(standardized_cadre_id));
                    pos.setPosition_title(position_title);
                    pos.setBasic_pay(Integer.parseInt(basic_pay));
                    status = dao.updatePosition(pos);
                    obj = new JSONObject();
                    if (status != 0) {
                        obj.put("status", "success");
                        obj.put("message", "Record Updated Successfully");
                        System.out.println(obj);
                    } else {
                        obj.put("status", "error");
                        obj.put("message", "Unable to Update Record");
                        System.out.println(obj);
                    }
                    out.print(obj);
                }
                break;

            default:
                obj = new JSONObject();
                obj.put("status", "error");
                obj.put("message", "Invalid action");
                out.print(obj);
                break;
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
