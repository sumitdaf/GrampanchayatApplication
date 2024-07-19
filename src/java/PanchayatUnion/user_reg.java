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
public class user_reg extends HttpServlet {

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
            String firstname = request.getParameter("firstname");
            String laststname = request.getParameter("laststname");
            String name = firstname+" "+laststname;
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            String voterid = request.getParameter("voterid");
            String adhar = request.getParameter("adhar");
            String wardno = request.getParameter("wardno");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            String pass = request.getParameter("password");
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String time = dateFormat.format(date);
            String statuss = "Waiting";

            System.out.println("wardno" + wardno + "name" + name + "email" + email + "phone" + phone + "voterid" + voterid + "address" + address);

            Connection conn = SQLconnection.getconnection();
            Connection con = SQLconnection.getconnection();
            Statement st = con.createStatement();

            try {
                ResultSet rs = st.executeQuery("select * from users where mailid='" + email + "'");
                int count = 0;
                while (rs.next()) {

                    count++;
                }
                if (count > 0) {
                    response.sendRedirect("user_reg.jsp?MailAlready");
                } else {

                    String sql = "insert into users(name, mailid, phone, voterid, adhar, wardno, address, time, statuss,gender,pass) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, name);
                    statement.setString(2, email);
                    statement.setString(3, phone);
                    statement.setString(4, voterid);
                    statement.setString(5, adhar);
                    statement.setString(6, wardno);
                    statement.setString(7, address);
                    statement.setString(8, time);
                    statement.setString(9, statuss);
                    statement.setString(10, gender);
                    statement.setString(11, pass);
                    int row = statement.executeUpdate();
                    if (row > 0) {

                        response.sendRedirect("User.jsp?Success");
                    } else {
                        response.sendRedirect("user_reg.jsp?Failed");
                    }

                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } catch (SQLException ex) {
            Logger.getLogger(user_reg.class.getName()).log(Level.SEVERE, null, ex);
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
