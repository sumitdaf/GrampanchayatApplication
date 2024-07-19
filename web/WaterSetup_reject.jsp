<%-- 
    Document   : WaterSetup_reject
    Created on : 12 May, 2022, 3:22:25 AM
    Author     : Beast
--%>

<%@page import="java.sql.Statement"%>
<%@page import="PanchayatUnion.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    /* TODO output your page here. You may use following sample code. */
    String id = request.getParameter("id");

    Connection conn = SQLconnection.getconnection();
    Statement sto = conn.createStatement();

    try {
        int i = sto.executeUpdate("update water_con set statuss='Rejected' where id='" + id + "'");
        System.out.println("test print==" + id);
        if (i != 0) {

            response.sendRedirect("SetWaterPipe.jsp?Rejected");
        } else {

            System.out.println("failed");
            response.sendRedirect("SetWaterPipe.jsp?Failed");
        }
    } catch (IOException | SQLException ex) {
    }

%>
