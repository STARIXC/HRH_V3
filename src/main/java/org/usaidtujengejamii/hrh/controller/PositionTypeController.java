package org.usaidtujengejamii.hrh.controller;

import utils.JSONConverter;
import utils.PositionDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Position;

/**
 * Servlet implementation class PositionTypeController
 */
@WebServlet("/PositionTypeController")
public class PositionTypeController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    Gson gson = new Gson();
    private final PositionDAO posDAO;
    int status = 0;
    String message = "";
    PrintWriter out;
    private JSONConverter json;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PositionTypeController() {
        this.posDAO = new PositionDAO();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getServletPath();
        switch (action) {
            case "/new":
                showNewForm(request, response);
                break;

            case "/insert": {
                try {
                    insertPos(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(PositionTypeController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            break;

            case "/delete": {
                try {
                    deletePos(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(PositionTypeController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            break;

            case "/edit":
                showEditForm(request, response);
                break;
            case "/update": {
                try {
                    updatePos(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(PositionTypeController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            break;

            default:
                ListPositions(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("add_designation.jsp");
        dispatcher.forward(request, response);
    }

    private void insertPos(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int carder_category_id = Integer.parseInt(request.getParameter("inputcadrecat"));
        int standardized_cadre_id = Integer.parseInt(request.getParameter("inputStandCadre"));
        String position_title = request.getParameter("inputPosition");
        int cadre_type_id = Integer.parseInt(request.getParameter("inputcadrecattype"));
        int basic_pay = Integer.parseInt(request.getParameter("basic_pay"));
        Position pos = new Position(carder_category_id, standardized_cadre_id, position_title,  basic_pay);
        posDAO.addPosition(pos);
        response.sendRedirect("/list");
    }

    private void updatePos(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("position_id"));
        int carder_category_id = Integer.parseInt(request.getParameter("inputcadrecat"));
        int standardized_cadre_id = Integer.parseInt(request.getParameter("inputStandCadre"));
        String position_title = request.getParameter("inputPosition");
  
        int basic_pay = Integer.parseInt(request.getParameter("basic_pay"));
        Position pos = new Position(id, carder_category_id, standardized_cadre_id, position_title,  basic_pay);
        posDAO.addPosition(pos);
        response.sendRedirect("/list");
    }

    private void deletePos(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        posDAO.deletePosition(id);
        response.sendRedirect("/list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Position existingPos = posDAO.getPositionById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("add_designation.jsp");
        request.setAttribute("existingPos", existingPos);
        dispatcher.forward(request, response);
    }

    private void ListPositions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("manage_designation.jsp");
        dispatcher.forward(request, response);
    }
}
