<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ss.dao.auditoriumsdao"%>
<%@page import="com.ss.entities.auditoriums"%>
<%@page import="com.ss.helper.connection_provider"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Explore venues</title>
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  <link href="assets/css/style.css" rel="stylesheet">
    </head>
    <body>
        <div class="container py-5">
            <div class="card">
                <div class="card-header" style="font-size: 28px;">
                    Available Auditoriums
                </div>
                <div class="card-body">
                    
                <%
                    List<auditoriums> a = new ArrayList<>();
                    auditoriumsdao ad = new auditoriumsdao(connection_provider.getConnection());
                    a = ad.getAuditoriums();
                    if(a.size()==0)
                    {
                    %>
                        <h3 class="font-monospace d-3">No Auditoriums available</h3>
                    <%}
                    else
                    {
                    for(auditoriums alist : a)
                    {
                    
                        if(alist.getVerification().equals("no"))
                    {
                   
                        
                    }
                    else
                    {
                %>
               
                    <b><h3><%=
                        alist.getName()
                    %></h3></b>
                    <div class="row">
                        <div class="col-sm-4">
                            Capacity: <%= alist.getCapacity()%>
                        </div>
                        <div class="col-sm-4">
                            Venue ID: <%= alist.getId()%>
                        </div>
                        <div class="col-sm-4">
                            <a href='college_info_page.jsp?id=<%= alist.getId()%>' class="btn btn-dark">Get more details</a>
                        </div>
                    </div>
                    
                    <hr>
                    
                    <%
                    }}}
                    %> 
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
    </body>
</html>
<!--<div class="container">
        <div class="card">
            <div class="card-header">    
            </div>
            <div class="card-body">
            </div>
            <div class="cardfooter">
            </div>
        </div>    
    </div>-->