/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.usaidtujengejamii.hrh.controller;

import utils.GetDates;
import utils.JSONConverter;
import com.google.gson.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.TimesheetSum;
import org.json.simple.JSONObject;

/**
 *
 * @author UTJ
 */
public class TimesheetSummary extends HttpServlet {

    PrintWriter out;
    int status, execute_activity = 0;
    private GetDates dao;
    Gson gson = new Gson();
    String result, nextPage;

    public TimesheetSummary() {
        super();
        dao = new GetDates();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // setting the response type
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String monthName = dao.MonthName(month);
        List<TimesheetSum> data = dao.getData(month, year);
        String _data = JSONConverter.convert(data);
        List<String> days = dao.getMonthDays(month, year);


        out.println("<thead>");
        out.println("<tr>");
        out.println("<th>S/L</th>");
        out.println("<th>year</th>");
        out.println("<th colspan='0' class='totalCol'>Month</th>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<th>#</th>");
        out.println("<th>" + year + "</th>");
        out.println("<th>" + monthName + "</th>");
//      //  System.out.println(days.size());
//        for (int i = 0; i < days.size(); i++) {
//            String day = days.get(i);
//            String dy = day.substring(0, 3);
//        //    System.out.println("days: " + dy);
//            out.println("<th >" + dy + "</th>");
//        }
        out.println("<th>Hours worked</th>");
        out.println("<th>Leave Hrs worked</th>");
        out.println("<th>Holidays worked</th>");
        out.println("<th>Earn Leave</th>");

        out.println("</tr>");
        out.println("</thead><tbody>");
        out.println("<tr>");
        out.println("<td>#</td>");
        out.println("<th>Name</th>");
        out.println("<th>Designation</th>");
//        for (int i = 0; i < days.size(); i++) {
//            int dt = i + 1;
////            String day = days.get(i);
////            String dy=day.substring(0,3);
//        //    System.out.println("days: " + dt);
//            out.println("<th >" + dt + "</th>");
//        }
        // out.println("<th>01</th>");

        out.println("<th>#</th>");
        out.println("<th>#</th>");
        out.println("<th>#</th>");
        out.println("<th>#</th>");

        out.println("</tr>");
        out.println("<tr>");
        System.out.println(data.size());
        for (int i = 0; i < data.size(); i++) {
            JSONObject jsonObj = new JSONObject();
            System.out.println("data: " + _data);

            // out.println("<th >" + name + "</th>");
        }
        out.println("</tr>");
        out.println("</tbody>");
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
