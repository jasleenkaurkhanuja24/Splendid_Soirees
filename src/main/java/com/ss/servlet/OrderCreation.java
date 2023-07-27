
package com.ss.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.*;
import com.razorpay.*;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import com.ss.dao.eventdao;
import com.ss.helper.connection_provider;
import io.github.cdimascio.dotenv.Dotenv;
/**
 *
 * @author 91700
 */
public class OrderCreation extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
           
    }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         RazorpayClient razorpayClient = null;
            String orderId=null;
            try(PrintWriter out = response.getWriter()){
                Dotenv dotenv = Dotenv.load();
            razorpayClient = new RazorpayClient(dotenv.get("API_KEY"),dotenv.get("API_SECRET"));
            System.out.println("hhhhhhhhhiiiiiiii");
JSONObject options = new JSONObject();
options.put("amount", 5000);
options.put("currency", "INR");
options.put("receipt", "txn_123456");
options.put("payment_capture",true);
Order order = razorpayClient.orders.create(options);
orderId = order.get("id");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RazorpayClient razorpayClient = null;
        try(PrintWriter out = response.getWriter()){
            razorpayClient = new RazorpayClient("rzp_test_TvUzjgsvhI2Zoq","Dsp598feTXK4nkGrzqcr1F4z");
            JSONObject options = new JSONObject();
            options.put("razoypay_payment_id",request.getParameter("razoypay_payment_id"));
            options.put("razoypay_order_id",request.getParameter("razoypay_order_id"));
            options.put("razoypay_signature",request.getParameter("razoypay_signature"));
            boolean s = Utils.verifyPaymentSignature(options, "Dsp598feTXK4nkGrzqcr1F4z");
            if(s){
                response.getWriter().append("done");
                System.out.println("done");
            }
                else
                {
                    response.getWriter().append("not done");
                    System.out.println("done");
                }
            
            }
            
        
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

