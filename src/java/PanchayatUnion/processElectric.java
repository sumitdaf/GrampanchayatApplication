/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PanchayatUnion;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Beast
 */
public class processElectric extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String id = request.getParameter("id");
            String scost = request.getParameter("scost");
            String statuss = "Active";
            Random RANDOM = new SecureRandom();
            int ACCCNO = 6;
            String letters = "123456789";
            String num = "";
            for (int k = 0; k < ACCCNO; k++) {
                int index = (int) (RANDOM.nextDouble() * letters.length());
                num += letters.substring(index, index + 1);
            }
            String elcuniqueid = "PUAS" + num;

            Connection conn = SQLconnection.getconnection();
            Statement sto = conn.createStatement();

            try {
                int i = sto.executeUpdate("update electricity_con set statuss='Active',elcuniqueid='" + elcuniqueid + "',price='" + scost + "' where id='" + id + "'");
                System.out.println("test print==" + id);
                if (i != 0) {

                    response.sendRedirect("NewElectricityEntry.jsp?Granted");
                } else {

                    System.out.println("failed");
                    response.sendRedirect("NewElectricityEntry.jsp?Failed");
                }
            } catch (IOException | SQLException ex) {
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserActivate.class.getName()).log(Level.SEVERE, null, ex);
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