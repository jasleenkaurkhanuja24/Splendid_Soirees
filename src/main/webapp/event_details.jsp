
<%@page import="com.ss.entities.auditoriums"%>
<%@page import="com.ss.dao.auditoriumsdao"%>
<%@page import="com.ss.entities.event"%>
<%@page import="com.ss.helper.connection_provider"%>
<%@page import="com.ss.dao.eventdao"%>
<%@page import="com.ss.entities.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    user u = (user)session.getAttribute("currentUser");
    if(u==null)
    {
        response.sendRedirect("login.jsp");
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Event Details</title>
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
    </head>
    <body>
        <div class="container my-3">
          <% 
              int id = Integer.parseInt(request.getParameter("id"));
          %>
          <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="card mt-5">
                        <div class="card-header text-center" style="background-color:#666666; color: #ffc451">
                            <%
                                eventdao ed = new eventdao(connection_provider.getConnection());
                                event e = ed.getEventById(id);
                            %>
                            <%
                                        auditoriumsdao ad = new auditoriumsdao(connection_provider.getConnection());
                                        auditoriums a = ad.getAuditoriumById(e.getAudi_id());
                                    %>
                            <h5><%=e.getEvent_name()%></h5>
                            
                        </div>
                            </div>
                            <div class="text-center"><img src = "assets/img/<%= e.getEvent_pic()%>" class="card-img-top my-2 text-center " style="height:350px ;width:400px;">
                            </div>
                            BY: <%= e.getInst_name()%><br>
                            
                                </div>
                                </div>
                                
                        <div class="row">
                        <div class="col-lg-6 offset-lg-1">
                            <div class="card mt-5 p-3">
                                <div class="vertical-scrollable" style="">
                                <div class="scroll">
                                <div class="row">
                            <div class="col-md-3">    
                            <p class=" text-muted"><b>Description: </b></p>
                            </div>
                                <div class="col-md-9">  
                            <%= e.getEvent_content() %>
                            </div>
                            <hr>
                            <div class="col-md-3">    
                            <p class=" text-muted"><b>Contact info:(Venue) </b></p>
                            </div>
                            <div class="col-md-9">  
                            <%= a.getContact() %>
                            </div>
                            </div>
                            </div>
                            </div>
                            </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="card mt-5 p-3">
                                <div class="row">
                                    <div class="col-md-5 text-muted"><b>Venue </b></div>
                                    <div class="col-md-7">
                                    
                                    
                                    <%= a.getName() %>
                                    </div>
                                    
                                </div>
                                    <hr>
                                    <div class="row">
                                    <div class="col-md-5 text-muted"><b>Address: </b></div>
                                    <div class="col-md-7">
                                       <%= a.getVenue() %>
                                    </div>
                                </div>
                                    <hr>
                                <div class="row">
                                    <div class="col-md-5 text-muted"><b>Date & Time: </b></div>
                                    <div class="col-md-7">
                                        <%= e.getEvent_date_from()  %> <%= e.getEvent_time_from() %> TO <%= e.getEvent_date_to() %> <%= e.getEvent_time_to() %>
                                    </div>
                                </div>
                                    <hr>
                                <div class="row">
                                    <div class="col-md-5 text-muted"><b>Refreshments: </b></div>
                                    <div class="col-md-7">
                                        
                                        <%= a.getRefreshments() %>
                                       
                                        
                                    </div>
                                </div>
                                        <hr>
                                <div class="row">
                                    <div class="col-md-5 text-muted"><b>Event Fee: </b></div>
                                    <div class="col-md-7">
                                       <%= a.getAudi_cost_student() %>
                                    </div>
                                </div>
                                    
                            </div>
                            </div>
                            </div>
                                    <hr>
                                    <a  href = "payment_gateway.jsp" style="background-color: #ff3333; color: white; text-align: center "> 
                                    <div class = "row offset-lg-1 ">
                                        <div class="card" style="border-radius: 20px;">
                                        <div class="" style="background-color: #ff3333; color: white; text-align: center " >
                                             REGISTER NOW ->  
                                            </div>
                                        </div>
                                    </div></a>
                            </div>
                                    <hr>
                       
                                
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        
            <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
    </body>
</html>
