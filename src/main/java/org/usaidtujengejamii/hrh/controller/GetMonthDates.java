/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.usaidtujengejamii.hrh.controller;

import utils.GetDates;
import utils.JSONConverter;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Day;

/**
 *
 * @author UTJ
 */
public class GetMonthDates extends HttpServlet {

PrintWriter out;
  int status, execute_activity = 0;
  private GetDates dao;
  
  Gson gson = new Gson();
  String result, nextPage;

  public GetMonthDates() {
    super();
    dao = new GetDates();

  }

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    out = response.getWriter();
    // setting the response type
    response.setContentType("application/json");
    //request.getParameter("action");
    String emp_no = request.getParameter("emp_no");
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    List<Day> days =  dao.getMonthDates(month, year, emp_no);
    System.out.println(emp_no);
boolean ans = days.isEmpty();
    if (ans == true) {
      List<Day> blank_days =  dao.getMonthBlankDates(month, year, emp_no);
      System.out.println(JSONConverter.convert(blank_days));
      out.println(JSONConverter.convert(blank_days));
    } else {
      System.out.println(JSONConverter.convert(days));
      out.println(JSONConverter.convert(days));
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
