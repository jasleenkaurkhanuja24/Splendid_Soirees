<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ss.dao.auditoriumsdao"%>
<%@page import="com.ss.entities.auditoriums"%>
<%@page import="com.ss.helper.connection_provider"%>
<%@page import="com.ss.entities.user"%>
<%
    user u=(user)session.getAttribute("currentUser");
    if(u==null)
    {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

  <link href="assets/css/style.css" rel="stylesheet">
    </head>
    <body>
        <% 
            int id = Integer.parseInt(request.getParameter("id"));
            auditoriumsdao ad = new auditoriumsdao(connection_provider.getConnection());
            auditoriums a = ad.getAuditoriumById(id);
        %>
        
        <div class="container">
            <div class="row">
                    <div class="col-md-8 offset-md-2">
            <div class="card">
                
                <div class="card-header text-center">
                    <b>
                <%=
                   a.getName()  
                %></b>
                </div>
                <div class="card-body container">
                    <div class="row">
                        <div class="col-md-4 offset-md-2">
                             Address
                        </div>
                        <div class="col-md-4 offset-md-1 text-muted">
                              <%= a.getVenue()%>
                        </div>
                    </div>
                   
                    <div class="row">
                        <div class="col-md-4 offset-md-2">
                             Capacity
                        </div>
                        <div class="col-md-4 offset-md-1 text-muted">
                              <%= a.getCapacity()%>
                        </div>
                    </div>                    
                     
                    <div class="row">
                        <div class="col-md-4 offset-md-2">
                             Rent per day
                        </div>
                        <div class="col-md-4  offset-md-1 text-muted">
                              <%= a.getAudi_cost()%>
                        </div>
                    </div>
                     
                    <div class="row">
                        <div class="col-md-4 offset-md-2">
                             Refreshments provided
                        </div>
                        <div class="col-md-4  offset-md-1 text-muted">
                              <%= a.getRefreshments()%>
                        </div>
                    </div>
                    
                    
                </div>
                <div class="card-footer">
                    
                    <div class="row">
                        <div class="col-md-4 offset-md-2">
                             Mobile number: 
                        </div>
                        <div class="col-md-4 offset-md-1 text-muted">
                            <%= a.getContact()%>
                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 offset-md-2">
                             Email Id
                        </div>
                        <div class="col-md-4 offset-md-1 text-muted">
                            <%= a.getEmailid()%>
                        </div>
                    </div>
                   
                </div>
            </div>
        </div>
                        </div>
                    </div>
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <script src="assets/js/main.js"></script>
    </body>
</html>
