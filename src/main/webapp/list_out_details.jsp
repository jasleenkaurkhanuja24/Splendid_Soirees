
<%@page import="com.ss.entities.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <div class="conatiner mt-5">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <div class="card">
                        <div class="card-header" style="font-size: 28px">
                           Details of the auditorium </div>
                        <div class="card-body">
        <form action="auditoriumservlet" method="post" enctype="multipart/form-data" id="audi">
            <input name="aname" type="text" class="form-control my-2" value="<%= u.getCollege()%> " class="text-muted">
            <input name="place_id" type="hidden" value="<%= u.getPlace_id() %>">
            <input type="text" name="avenue"placeholder="venue"  class="form-control my-2">
            <input name="acost" type="text" placeholder="cost"  class="form-control my-2">
            <input name="acapacity" type="text" placeholder="capacity"  class="form-control my-2">
            <input name="arefreshments" type="textarea" placeholder="refreshments"  class="form-control my-2">
            <input name="student_cost" type="varchar" placeholder="Amount to be charged from the students??" class="form-control my-2">
            <input name="anumber" type="text" placeholder="number"  class="form-control my-2">
            <input name="aemailid" type="email" placeholder="emailid"  class="form-control my-2">
            A legal Document
            <input name="alegalpaper" type="file"  class="form-control my-2">
            Picture of the Auditoriums
            <input name="picture" type="file" class="form-control my-2">
            <button type="submit"class="btn btn-secondary">Submit</button> 
        </form>
                            </div>
                        </div>
                </div><!-- </div> -->
                </div>
            </div>
         <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
           <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
         <script>
            $(document).ready(function()
            {
                $("#audi").on("submit",function(event)
                {
                    event.preventDefault();
                    let form = new FormData(this);
                    $.ajax({
                        url:"auditoriumservlet",
                        type:'POST',
                        data:form,
                        success: function(data,textStatus,jqXHR)
                        {
                            if(data.trim()==="listedout")
                            {
                            console.log("pass");
                            swal({
                            title: "Auditorium details captured successfully.",
                            text: "Your auditorium will be listed out after the verification",
                            icon: "success",
                            button: "OK",
                            });
                            }
                             else if(data.trim()==="ohnof")
                            {
                            console.log("pass");
                            swal({
                            text: "Fill all the details",
                            icon: "error",
                            button: "OK",
                            });
                        }
                        
                        else
                        {
                            console.log("ohno");
                            swal({
                            title: "Auditorium details not saved.",
                            text: "Please try again.",
                            icon: "error",
                            button: "OK",
                            });
                        }
                        },
                        error: function(jqXHR,textStatus,errorThrown)
                        {
                            console.log("fail");
                            swal({
                            title: "Post was not added...",
                            text: "Something went wrong.",
                            icon: "error",
                            button: "OK",
                            });
                        },
                        processData:false,
                        contentType:false
                    })
                })
            });
        </script>

    </body>
</html>
