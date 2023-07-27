<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
  
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

  <link href="assets/css/style.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3" id="box-1">
                    <div class="card mt-5">
                        <form action = "passwordServlet" method="post" id="forgot-button">
                        <div class="card-header">
                            Enter your email id
                        </div>
                        <div class="card-body ">
                            <input type="email" id="idn" name="email" placeholder="xyz@gmail.com" class="form-control"><br>
                            <button type="submit"  class=" btn btn-outline-dark">Get OTP</button>
                        </div>
                            
                        </form>
                        </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 offset-lg-3" id="box-2" style="display: none;">
                    <div class="card mt-5">
                        <form action = "otpervlet" method="post" id="otp-button">
                        <div class="card-header">
                            Enter OTP
                        </div>
                        <div class="card-body ">
                            <input type="text" name="otp" class="form-control"><br>
                            <button type="submit" class=" btn btn-outline-dark">Submit</button>
                        </div>
                            
                        </form>
                        <h5 id="alternate" style="font-family: cursive;display: none;">Enter the code we have sent you on the given email id.<h5>
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
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  
  <script src="assets/js/main.js"></script>
  <script>
      $(document).ready(function(){
          $("#forgot-button").on('submit',function(event){
              event.preventDefault();
              let f = new FormData(this);
              $.ajax({
                url:"passwordServlet",
                data:f,
                type:'POST',
                success : function(data,textStatus,jqXHR)
                {
                    $("#alternate").show();
                    $("#box-2").show();
                    $("#box-1").hide();
                    console.log("done");
                },
                error : function(jqXHR,textStatus,errorThrown)
                {
                    console.log("not done");
                },
                contentType:false,
                processData:false
              })
          })
          $("#otp-button").on('submit',function(event){
              event.preventDefault();
              let f = new FormData(this);
              $.ajax({
                url:"otpservlet",
                data:f,
                type:'POST',
                success : function(data,textStatus,jqXHR)
                {
                    if(data.trim()==="wrongotp")
                    {
                        console.log("wrong otp");
                        swal("Wrong OTP, retry.");
                    }
                    else
                    {
                        console.log("hao");
                        var id = $("#idn").html();
                        swal("Change password")
                          .then((value) => {
                          
                          window.location="change_password.jsp";
                          });
                    }
                    console.log("done");
                },
                error : function(jqXHR,textStatus,errorThrown)
                {
                    console.log("not done");
                },
                contentType:false,
                processData:false
              })
          })
      });
  </script>
    </body>
</html>
