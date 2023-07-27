package com.ss.servlet;

import com.ss.dao.eventdao;
import com.ss.dao.notificationdao;
import com.ss.helper.connection_provider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@MultipartConfig
public class notificationservlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) 
        {
              String action = request.getParameter("d");
              System.out.println("action " + action);
              int id = Integer.parseInt(request.getParameter("f"));
              System.out.println("id "+id);
              int event_id = Integer.parseInt(request.getParameter("event_id"));
              System.out.println("event_id "+event_id);
              String from = request.getParameter("to");
              System.out.println("from "+from);
              String to = request.getParameter("from");
              System.out.println("to " + to);
              if(action==null)
              {
                  out.println("wrong");
              }
              else
              {
                  notificationdao nd = new notificationdao(connection_provider.getConnection());
                  boolean c = nd.deleteNotification(id);
                  if(c==false)
                  {
                      
                      System.out.println("wrong");
                      out.println("wrong");
                  }
                  else
                  {
                      String newnotification;
                      if(action.equals("Yes"))
                      {
                          newnotification = from + " has accepted your request to rent their auditorium for rent.\nProceed to pay.";
                          nd.sendNotification(from, to, newnotification,"Organizer",event_id);
                          System.out.println("numnum");
                      }
                      else if(action.equals("No"))
                      {
                          newnotification = from + " has rejected your request to rent their auditorium for rent.";
                          nd.sendNotification(from, to, newnotification,"Organizer",event_id);
                          System.out.println("numnum");
                      }
                      else if(action.equals("OK"))
                      {
                          eventdao ed = new eventdao(connection_provider.getConnection());
                          boolean s = ed.updateEvent(event_id);
                          if(s == true)
                          {
                              out.print("payment");
                              System.out.print("payment krlo yr");
                          }
                          else
                          {
                              out.print("paymentno");
                              System.out.print("payment nhi hoga");
                          }
                      }
                  }
              }
        }
        catch(Exception e)
        {
            e.printStackTrace();
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
