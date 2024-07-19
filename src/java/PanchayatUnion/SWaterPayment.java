/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PanchayatUnion;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
public class SWaterPayment extends HttpServlet {

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

            Connection conn = SQLconnection.getconnection();
            Statement sto = conn.createStatement();
            Statement st = conn.createStatement();
            Statement st1 = conn.createStatement();

            try {
                int i = sto.executeUpdate("update water_con set billstatus='Paid' where id='" + id + "'");
                System.out.println("test print==" + id);
                if (i != 0) {
                    System.out.println("test print==" + i);
                    ResultSet rs = st.executeQuery("SELECT * FROM expenses");
                    rs.next();
                    double exp = rs.getDouble("expenses_recived");
                    double spe = rs.getDouble("expenses_spent");
                    double bal = rs.getDouble("expenses_balance");
                    System.out.println("exp==" + exp);
                    int paid = Integer.parseInt(scost);
                    System.out.println("paid==" + paid);

                    double total = exp + paid;
                    System.out.println("total==" + total);
                    double per = paid * 0.15;
                    double spen = paid - per;
                    double spent = spe + spen;
                    double balance= bal+per;
                    int k = st1.executeUpdate("update expenses set expenses_recived='" + total + "',expenses_spent='" + spent + "',expenses_balance='"+balance+"'");

                    response.sendRedirect("MyRequest.jsp?Granted");
                } else {

                    System.out.println("failed");
                    response.sendRedirect("MyRequest.jsp?Failed");
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
