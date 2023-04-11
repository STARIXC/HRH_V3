<%-- 
    Document   : footer
    Created on : Jul 6, 2022, 9:02:19 AM
    Author     : UTJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body>
        <%
Calendar cal = Calendar.getInstance();
int year= cal.get(Calendar.YEAR);              

%>
        <footer class="footer text-center">
         <%=year%> &copy <strong><a href="" target="_blank">USAID Tujenge Jamii</a>
            </strong> All rights reserved.
        </footer>
    </body>
</html>
