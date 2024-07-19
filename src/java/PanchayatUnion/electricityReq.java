/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PanchayatUnion;

import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Beast
 */
@MultipartConfig(maxFileSize = 16177215)
public class electricityReq extends HttpServlet {

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
             HttpSession user = request.getSession(true);
            String name = request.getParameter("name");
            String fname = request.getParameter("fname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String etype = request.getParameter("etype");
            String address = request.getParameter("address");
            String uid = user.getAttribute("uid").toString();
            String uwardno = user.getAttribute("uwardno").toString();
            
            
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String time = dateFormat.format(date);
            String statuss = "Waiting";
            String price = "Waiting";
            String billstatus = "Waiting";

            System.out.println("wardno" + uwardno + "name" + name + "email" + email + "phone" + phone + "etype" + etype + "address" + address);

            InputStream inputStream = null;
            Part filePart = request.getPart("idproof");
            if (filePart != null) {
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());
                inputStream = filePart.getInputStream();
            }

            Connection conn = SQLconnection.getconnection();
            Connection con = SQLconnection.getconnection();
            Statement st = con.createStatement();

            try {
                String sql = "insert into electricity_con(name, fname, email, phone, idproof, etype, address, statuss, price, billstatus, time, uid, uwardno) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, name);
                statement.setString(2, fname);
                statement.setString(3, email);
                statement.setString(4, phone);
                if (inputStream != null) {
                    statement.setBlob(5, inputStream);
                }
                statement.setString(6, etype);
                statement.setString(7, address);
                statement.setString(8, statuss);
                statement.setString(9, price);
                statement.setString(10, billstatus);
                statement.setString(11, time);
                statement.setString(12, uid);
                statement.setString(13, uwardno);
                int row = statement.executeUpdate();
                if (row > 0) {

                    response.sendRedirect("ElectricityReq.jsp?Success");
                } else {
                    response.sendRedirect("ElectricityReq.jsp?Failed");
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
