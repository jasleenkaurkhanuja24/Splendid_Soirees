
package com.ss.servlet;

import com.ss.dao.saveuser;
import com.ss.entities.user;
import com.ss.helper.connection_provider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.ss.helper.Message;

public class login_details extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet login_details</title>");            
            out.println("</head>");
            out.println("<body>");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            saveuser us = new saveuser(connection_provider.getConnection());
            user u = us.getUserData(email, password);
            if(u!=null)
            {
                //out.println("<h1>loginsuccessful</h1>");
                HttpSession s = request.getSession();
                s.setAttribute("currentUser",u);
                response.sendRedirect("event.jsp");
            }
            else
            {
                //out.println("<h1>Invalid Email Id or Password!!</h1>");
                Message m = new Message("Invalid Email Id or Password!!","error","alert-danger");
                HttpSession s = request.getSession();
                s.setAttribute("msg", m);
                response.sendRedirect("login.jsp");
            }
            out.println("<h1>Servlet login_details at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
//MP09UF1734