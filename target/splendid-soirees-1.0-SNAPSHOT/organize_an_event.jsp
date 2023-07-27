<%@page import="com.ss.entities.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ss.dao.auditoriumsdao"%>
<%@page import="com.ss.entities.auditoriums"%>
<%@page import="com.ss.helper.connection_provider"%>

<%
    user u = (user)session.getAttribute("currentUser");
    if(u==null)
    {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Organize an event</title>
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
        <div class="conatiner mt-5">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <div class="card">
                        <div class="card-header" style="font-size: 28px">
                           Details of the auditorium </div>
                        <div class="card-body">
        
        <form action="eventservlet" method="post" id="submit-event" enctype="multipart/form-data">
            <input name="efdate" type="date" placeholder="datefrom" class="rounded-3 form-control my-2">
            <input type="time" name="eftime" placeholder="timefrom" class="rounded-3 form-control my-2">
            <input name="etdate" type="date" placeholder="dateto" class="rounded-3 form-control my-2">
            <input type="time" name="ettime" placeholder="timeto" class="rounded-3 form-control my-2">
            <input name="ename" type="text" placeholder="name" class="rounded-3 form-control my-2">
            <input name="einstname" type="text" value="<%= u.getCollege()%>" class="rounded-3 form-control my-2">
           
            <input type="hidden" name = "user" value = "<%= u.getEmail() %>">
            <input type="text" name="ecapacity" placeholder="capacity(approx)" class="rounded-3 form-control my-2">
            <div class="form-control">
                Any poster you would like to add?<br>
                <input type="file" name="poster">
            </div>
            
            <div class="row">
                <div class="col-lg-8">
                    <select name="audi_id" class="form-control rounded-3 my-2">
                <option selected disabled > Select auditoriums <option>
                <%
                    List<auditoriums> a = new ArrayList<>();
                    auditoriumsdao ad = new auditoriumsdao(connection_provider.getConnection());
                    a = ad.getAuditoriums();
                    for(auditoriums alist : a)
                    {
                        if(alist.getVerification().equals("no") || alist.getPlace_id()==u.getPlace_id())
                    {}
                    
                    else
                    {
                %>
                <option value="<%= alist.getId() %>">
                    <%=
                        alist.getName()
                    %>
                </option>
                <%
                    }
                    }
                %>
            </select>
                </div>
            <div class="col-lg-4">
                 <a href="explore_colleges.jsp" class="btn btn-secondary my-2 rounded-3">Explore venues</a>
            
                </div>
            </div>
           <div class="form-control">Need Refreshments :<br>
            YES
            <input type="radio" name="refreshmentneeded" class="p-2" value="yes" placeholder="re">
            NO
            <input type="radio" name="refreshmentneeded" class="p-2" value="no">
            </div>  
           <textarea name="edetails" placeholder="details" class="rounded-3 form-control my-2"></textarea>

            <button type="submit" class="rounded-3 btn btn-secondary my-2">Submit</button>
        </form>
            </div>
                        </div>
                </div><!-- </div> -->
                </div>
            </div>
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
  <script>
      $(document).ready(function()
      {
          console.log("ima in");
          $("#submit-event").on("submit",function(event){
              event.preventDefault();
              let f = new FormData(this);
              $.ajax({
                  url:"eventservlet",
                  data:f,
                  type:'POST',
                  success:function(data,textStatus,jqXHR)
                  {
                      console.log("ima in success");
                      if(data.trim()==='Done')
                      {
//                          swal({"Your details have been saved, you will soon get a notification about the auditorium!")
//                          .then((value) => {
//                          window.location="event.jsp";
//                                  });
                              swal({
                              text:"Your details have been saved, you will soon get a notification about the auditorium!",
                              icon:"success",
                              title:"Details saved successfully",
                              button:"OK"
                          }).then((value) =>{
                          window.location="event.jsp";
                      })}
                      else if(data.trim()==='Notdone')
                      {
                          swal({
                              title:"Something went wrong.",
                              icon:"error",
                              button:"Try again",
                          });
                      }
                      else if(data.trim()==='fill')
                      {
                          swal({
                              text:"Fill in all the details.",
                              button:"OK"
                          });
                      }
                  },
                  error:function(jqXHR,textStatus,errorThrown)
                  {
                      console.log("ima in error");
                      swal({
                              title:"Something went wrong in error.",
                              icon:"error",
                              button:"Try again",
                          });
                  },
                  processData:false,
                  contentType:false
              })
          })
      });
  </script>

  <script src="assets/js/main.js"></script>
    </body>
</html>
