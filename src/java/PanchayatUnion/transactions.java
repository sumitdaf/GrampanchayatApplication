/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PanchayatUnion;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class transactions extends HttpServlet {

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

            String wardno = request.getParameter("wardno");
            String spentfor = request.getParameter("spentfor");
            String amount = request.getParameter("amount");
             DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String time = dateFormat.format(date);

            Connection conn = SQLconnection.getconnection();
            Statement sto = conn.createStatement();
            Statement st = conn.createStatement();
            Statement st1 = conn.createStatement();

            try {
                    ResultSet rs = sto.executeQuery("SELECT * FROM ward_details where wardno ='"+wardno+"'");
                    if(rs.next())
                    {
                    double exp = rs.getDouble("expenseall");
                    double spen = rs.getDouble("exp_spent");
                    double bal = rs.getDouble("exp_bal");
                    double amt=Double.parseDouble(amount);
                    
                    System.out.println("exp==" + exp);
                    double total = exp-amt;
                    int k = st1.executeUpdate("update ward_details set exp_spent='" + amt + "',exp_bal='" + total + "' where wardno='"+wardno+"'");
     
                    String sql = "insert into transactions(wardno, spentfor, amount, time) values (?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, wardno);
                statement.setString(2, spentfor);
                statement.setString(3, amount);
                statement.setString(4, time);
                int row = statement.executeUpdate();
                if (row > 0) {

                    response.sendRedirect("WardExpenses.jsp?Success");
                } else {
                    response.sendRedirect("WardExpenses.jsp?Failed");
                }
                } 
                    else {

                    System.out.println("failed");
                    response.sendRedirect("WardExpenses.jsp?Failed");
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
