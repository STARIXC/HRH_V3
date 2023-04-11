package org.usaidtujengejamii.hrh.controller;

import utils.JSONConverter;
import utils.PositionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/GetPostionServlet")
public class GetPostionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    HttpSession session = null;
//    private final DatabaseConnection conn;
    PrintWriter out;
    public PositionDAO dao;
    public JSONConverter json;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPostionServlet() {
        super();
       dao = new PositionDAO();
//       conn= new DatabaseConnection();
    }

    @SuppressWarnings("static-access")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        Position position = new Position();
        out = response.getWriter();
        String standard_id, current_position;
        standard_id = request.getParameter("cadre");
        
        current_position = json.convert(dao.getPositionBySId(standard_id));
      //  System.out.println(current_position);
        out.println(current_position);
    }

    /**
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        processRequest(request, response);
    }

    /**
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
