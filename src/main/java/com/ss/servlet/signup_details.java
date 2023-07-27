package com.ss.servlet;

import com.ss.dao.saveuser;
import com.ss.entities.user;
import com.ss.helper.connection_provider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@MultipartConfig
public class signup_details extends HttpServlet 
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) 
        {
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String password1 = request.getParameter("password1");
            String password2 = request.getParameter("password2");
            String role = request.getParameter("role");
            String college = request.getParameter("college");
            System.out.println(role);
                System.out.println(firstname);
                System.out.println(email);
                System.out.println(password1);
                System.out.println(lastname);
                System.out.println(college);
            if(role==null || firstname.equals("") || email.equals("") || password1.equals("") ||password2.equals("") || college.equals(""))
            {
                out.println("Values");
                System.out.println("role " + role);
                System.out.println("name " + firstname);
                System.out.println("email " + email);
            }
            else if(password1.length()<8)
            {
                out.println("PassShort");
            }
            else if(!password1.equals(password2) )
            {
                out.println("Wrongpass");
            }
            else if(password1.equals(password2) )
            {
                user u = new user(firstname, lastname, email, password1, role, college);
                saveuser save = new saveuser(connection_provider.getConnection());
                boolean c = save.saveUserData(u);
                if(c==true)
                {
                    out.println("Done");
                }
                else
                {
                    out.println("Present");
                }
            }
        }
        catch(Exception e)
        {
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
