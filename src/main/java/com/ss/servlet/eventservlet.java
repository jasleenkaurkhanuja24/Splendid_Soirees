package com.ss.servlet;

import com.ss.dao.eventdao;
import com.ss.dao.notificationdao;
import com.ss.entities.event;
import com.ss.entities.notification;
import com.ss.helper.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;

@MultipartConfig
public class eventservlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet eventservlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet eventservlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
              String name = request.getParameter("ename");
              String instname = request.getParameter("einstname");
              String c = request.getParameter("ecapacity");
              String fdate = request.getParameter("efdate");
              String tdate = request.getParameter("etdate");
              String ftime = request.getParameter("eftime");
//              String d = request.getParameter("eduration");
              String ttime = request.getParameter("ettime");
              String details = request.getParameter("edetails");
              String refreshments = request.getParameter("refreshmentneeded");
              String id = (request.getParameter("audi_id"));
              Part part = request.getPart("poster");
              String poster = part.getSubmittedFileName();
//              String place_id = (request.getParameter("audi_id"));
//              System.out.println(name);
//              System.out.println(instname);
//              //System.out.println(date);
//              System.out.println(d);
//              //System.out.println(time);
//              System.out.println(details);
//              System.out.println(refreshments);
              System.out.println(id);
              if(name.equals("") || instname.equals("") || tdate.equals("") || ttime.equals("")|| fdate.equals("") || id.equals("") || id==null || ftime.equals("")  || details.equals("")  || c.equals(""))
              {
                  out.println("fill");
              }
              else
              {
                  int p_id ;
//              int duration = Integer.parseInt(d);
                int audi_id = Integer.parseInt(id);
//                int p_id = Integer.parseInt(place_id);
                int capacity = Integer.parseInt(c);
                event e = null;
              int s;
               eventdao edao = new eventdao(connection_provider.getConnection());
              if(poster.equals("") )
              {
                  p_id = edao.getPlaceId(audi_id);
                  e = new event(name,instname,details,fdate,ftime,tdate,ttime,capacity,refreshments,audi_id,p_id);
                  s = edao.saveeventData(e);
              }
              else
              {
                  p_id = edao.getPlaceId(audi_id);
                  e = new event(name,instname,details,fdate,ftime,tdate,ttime,capacity,refreshments,poster,audi_id,p_id);
                  s = edao.saveeventDatawithposter(e);
              }
             
              if(s!=0)
              {
                  String from = request.getParameter("user");
                  notificationdao nd = new notificationdao(connection_provider.getConnection());
                  String to = nd.getTo(p_id);
                  
                  String content = instname + " college requests you to rent your auditorium from " + fdate + " " + ftime + " to " + tdate + " " + ttime + "\nWould you like to rent your auditorium?";
                  boolean d = nd.sendNotification(from, to, content,"Renter",s);
                  if(d==true)
                  {
                      System.out.println("notification sent");
                  }   
                  else
                  {
                      System.out.println("notification not sent");
                  }
                String path = request.getRealPath("/")+"assets" + File.separator + "img" +File.separator+e.getEvent_pic();
                savefile sf = new savefile();
                if(sf.savingfile(part.getInputStream(),path))
                {
                    System.out.println("done");
                }
                else
                {
                    System.out.println("notdone");
                }
                
                  out.println("Done");
              }
              else if(s==0)
              {
                  out.println("Notdone");
              }
              }
        }
        catch(Exception e)
        {
            e.printStackTrace();
            //System.out.println("ok" + e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
7        * @param request servlet request
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
