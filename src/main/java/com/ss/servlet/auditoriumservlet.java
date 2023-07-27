
package com.ss.servlet;

import com.ss.dao.auditoriumsdao;
import com.ss.entities.auditoriums;
import com.ss.helper.connection_provider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
@MultipartConfig
public class auditoriumservlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet auditoriumservlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet auditoriumservlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
              String name = request.getParameter("aname");
              String venue = request.getParameter("avenue");
              Part part = request.getPart("alegalpaper");
              String legalpaper = part.getSubmittedFileName();
              Part part1 = request.getPart("picture");
              String picture = part1.getSubmittedFileName();
              String capacity = (request.getParameter("acapacity"));
              //out.println(edate);
              String cost = (request.getParameter("acost"));
              String refreshments = request.getParameter("arefreshments");
              String contact = request.getParameter("anumber");
              //out.println(time);
              String emailid = request.getParameter("aemailid");
              String student_cost = request.getParameter("student_cost");
              String p_id = (request.getParameter("place_id"));
              //String legalpaper = request.getParameter("edate");
//              System.out.println(name);
              System.out.println(p_id);
//              //System.out.println(date);
//              System.out.println(capacity);
//              System.out.println(cost);
//              System.out.println(refreshments);
//              //System.out.println(number);
//              System.out.println(emailid);
              if(p_id==null || name.equals("") || venue.equals("") || capacity.equals("") || cost.equals("") || contact.equals("") || emailid.equals("") || legalpaper.equals("") || picture.equals(""))
              {
                  out.println("ohnof");
              }
              else
              {
                  System.out.print("ok");
                  int place_id = Integer.parseInt(p_id);
                auditoriums a = new auditoriums(name,venue,capacity,refreshments,cost,contact,emailid,legalpaper,picture,place_id,student_cost);
                auditoriumsdao ad = new auditoriumsdao(connection_provider.getConnection());
                boolean c = ad.saveAuditoriumDetails(a);
                if(c==true)
                {
                    out.println("listedout");
                }
                else
                {
                    out.println("ohno");
                }
              }
            }
        catch(Exception e)
        {
            e.printStackTrace();
            System.out.println(e);
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
