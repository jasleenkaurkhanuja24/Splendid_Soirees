
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
<!--        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
  
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>


  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <style>
      * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.body{
    font-size: 14px;
    background: #f2f2f2;
}

.container {
    background: white;
    width: 500px;
    padding: 25px;
    margin: 50px auto 0;
    border-top: 5px solid #e99f01;
    box-shadow: 0 0 7px 5px rgba(0, 0, 0, 0.5);
}

.container h2 {
    font-size: 24px;
    line-height: 24px;
    padding: 30px;
    text-align: center;
}

.input-name {
    width: 90%;
    position: relative;
    margin: 20px auto;
}

.lock {
    padding: 8px 11px;
}

.name {
    width: 45%;
    padding: 8px 0 8px 40px;
}

.name i {
    padding: 8px;
}

.input-name span {
    margin-left: 35px;
}

.text-name{
    width: 100%;
    padding: 8px 0 8px 40px;
}

.input-name i {
    position: absolute;
    font-size: 18px;
    border-right: 1px solid #cccccc;
}

.email {
    padding: 8px;
}

.text-name,
.name {
    border: 1px solid #cccccc;
    outline: none;
    -webkit-transition: all 0.30s ease-in-out;
    -moz-transition: all 0.30s ease-in-out;
    -ms-transition: all 0.30s ease-in-out;
    transition: all 0.30s ease-in-out;
}

.text-name:hover,
.name:hover {
    background-color: #eaf5d6;
}

.text-name:focus,
.name:focus {
    border: 1px solid #e99f01
}

.radio-button {
    margin-right: 4px;
}

.check {
    margin-right: 15px;
    position: relative;
}

/* .check::before {
    content: " ";
    display: inline-block;
    width: 8px;
    height: 8px;
    margin-right: 8px;
    vertical-align: -2px;
    border: 2px solid #cccccc;
    padding: 2.5px;
    background-color: transparent;
    background-clip: content-box;
    transition: all 0.2s ease;
}

.check::after {
    border-right: 2px solid black;
    border-top: 2px solid black;
    content: "";
    height: 20px;
    left: 2px;
    position: absolute;
    top: 7px;
    transform: scaleX(-1) rotate(135deg);
    transform-origin: left top;
    width: 7px;
    display: none;
} */

.check-button {
    border: 0;
    clip: rect(0 0 0 0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    position: absolute;
    width: 1px;
}

/* .check-button:hover+.check::before {
    border-color: rgb(189, 189, 57);
}

.check-button:checked+.check::before {
    border-color: green;
}

.check-button:checked+.check::after {
    -moz-animation: check 0.8s ease 0s running;
    -webkit-animation: check 0.8s ease 0s running;
    animation: check 0.8s ease 0s running;
    width: 7px;
    height: 20px;
    border-color: green;
}  */

.button
{
    background-color: #e99f01;
    color: white;
    height : 35px;
    line-height: 35px;
    width: 100%;
    border: none;
    outline: none;
    font-size: 18px;
    cursor: pointer;
    margin-bottom: 10px ;
}

.button:hover{
    background-color: #e99f01;
}

@media (max-width : 480px)
{
    .container
    {
        width: 100%;
        border:2px solid ;
    }
    .input-name
    {
        margin-bottom : -10px;
    }
    .name
    {
        width : 100%;
        padding: 8px 0 8px 40px;
        margin-bottom : 10px;
    }
    .input-name span{
        padding: 0;
        margin: 0;
    } 
}



  </style>
    </head>
    <body class = "signup">
         <div class = "container" >
        <h2>Registration Details</h2>
        <div class = "form-container">
            <form action="signup_details" method="post" id="su">

                <div class = "input-name">
                    <i class="fa fa-user lock"></i>
                    <input type="text" placeholder="First Name" name="firstname" class = "name" required>
                    <span>
                        <i class="fa fa-user lock"></i>
                        <input type="text" name="lastname" placeholder="Last Name" class = "name" required>
                    </span>
                </div>

                <div class = "input-name">

                    <i class="fa fa-envelope email"></i>
                    <input type="email" name="email" placeholder="Email ID" class = text-name required>
                </div>

                <div class = "input-name">

                    <i class="fa fa-lock lock"></i>
                    <input type="password" placeholder="Password" class = "text-name" name="password1" required>
                  
                </div>

                <div class = "input-name">
                    <i class="fa fa-lock lock"></i>
                    <input type="password" placeholder="Confirm Password" class = "text-name" name="password2" required>
                </div>

                <div class = "input-name">
                    <i class="fa fa-university" style="padding : 8px; padding-top: 5px;"></i>
                    <input type="text" placeholder="Which college are you from ?" class = "text-name" name="college" required>
                </div>

                <div class = "input-name">
                    <input type="radio" class="radio-button" name="role" required  value="Organizer" >
                    <label style="margin-right: 30px;">Organizer<b>\</b>Owner</label>
                    
                    <input type="radio" class="radio-button" name="role" required value="Student">
                    <label>Student</label>
                  
                </div>

                <div class = "input-name">
                    <input type="checkbox" >
                    <!-- <input type="checkbox" class="check-button"> -->
                    <label class="check">I Accept the terms & conditions</label>
                </div>

                <div class = "input-name">
                    <button type="submit" class="button" value="SignUp" id="submit-id">Sign-Up</button>
                </div>
                                <div class="container text-center" id="loader" style="display:none;">
                                <span class="fa fa-refresh fa-spin fa-4x"></span>
                                <h3>Please Wait</h3>
                            </div>
                                
                                <h3 style="display: none;" id="success"></h3>
            </form>
        </div>
    </div>
<!--<main>
        <main class="d-flex align-items-center ">                      
                   
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="card" >
                        <div class="card-header log">
                            <h3>Sign-Up</h3>
                        </div>
                        <div class="card-content container mt-3 p-3" >
                            <form action="signup_details" method="post" id="su">
                                <div class="row">
                                <div class="col-md-6 ">
                                First Name<br><input type="text" name="firstname" class="form-control" placeholder="Enter first name"><br>
                                </div>
                                <div class="col-md-6 ">
                                Last name<br><input type="text" name="lastname" class="form-control" placeholder="Enter last name"><br>
                                </div>
                                    </div>
                                <div class="row">
                                    <div class="col-md-6">
                                 
                                Set Password<br><input type="password" name="password1" class="form-control" placeholder="Enter password"><br>
                                
                                </div>
                                    <div class="col-md-6">
                                        Rewrite password<br><input type="password" name="password2" class="form-control" placeholder="Re-Enter Password"><br>
                               </div> </div>
                                <div class="row">
                                    <div class="col-md-6">
                                Email Id<br><input type="email" name="email" class="form-control" placeholder="Enter emailid"><br>
                                </div>
                                    <div class="col-md-6">
                                        Which college are you from?
                                        <input type="text" name="college" class="form-control" placeholder="Enter college">
                                        </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                Are you a<br>
                                
                                <input type="radio" name="role" value="Organizer" style="padding: 5px">  Organizer/Place Owner<br>
                                <input type="radio" name="role" value="Student" style="padding: 5px">    Student<br>
                                </div>
                                    
                                </div>
                                <div class="container text-center" id="loader" style="display:none;">
                                <span class="fa fa-refresh fa-spin fa-4x"></span>
                                <h3>Please Wait</h3>
                            </div>
                                <button type="submit" class="btn btn-outline-primary " style="margin: 5px" id="submit-id">Sign-Up</button>
                                <h3 style="display: none;" id="success"></h3>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
            </main>
        </main>-->

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
  $(document).ready(function(){
                console.log("Loaded...");
                $("#su").on('submit',function(event){
                    //to stop the page to be reloaded
                   event.preventDefault();
                   //getting form data in form
                   
                   let form = new FormData(this);
                   $("#submit-id").hide();
                   $("#loader").show();
                   $("#success").hide();
                   //submitting form on the servlet
                   $.ajax({
                      url: "signup_details",
                      data: form,
                      type: 'POST',
                      success:function(data,textStatus,jqXHR){
                          console.log(data);
                          $("#submit-id").show();
                          $("#loader").hide();
                          
                          if(data.trim()==='Done')
                          {
                              swal({
                              title:"Registered Successfully, Go to login page.",
                             icon:"success",
                              button:"Login",
                          }).then((value) => {
                          window.location="login.jsp";
                          });
                          $('#success').show();
//                          $('#success').html("You have been signed up successfully...");
                      }
                      else if(data.trim()==='Wrongpass')
                      {
                          console.log(data);
                          $('#success').show();
                          swal({
                              title:" Passwords don't match!!",
                              icon:"error",
                              button:"Try again",
                          });
//                          $('#success').html("Different passwords were entered both the times");
                      }
                      else if(data.trim()==='PassShort')
                      {
                           $('#success').show();
                           swal({
                              title:"Password should contain atleast 8 characters",
//                              icon:"error",
                              button:"Try again",
                          });
//                           $('#success').html("Password should contain atleast 8 characters");
                      }
                      else if(data.trim()==='Values')
                      {
                          swal("Fill in all the details.");
                      }
                      else if(data.trim()==='Present')
                      {
                          swal("User Already exists, Go to login page.")
                          .then((value) => {
                          
                          window.location="login.jsp";
                          });
                           $('#success').show();
                           //$('#success').html("User already exists.");
                      }
                      },
                      error:function(jqXHR,textStatus,errorThrown){
                          console.log("failed");
                          console.log(data);
                          $("#submit-id").show();
                          $("#loader").hide();
                              $("#success").show();
                               swal({
                              title:"User alreay exists",
//                              icon:"error",
                              button:"Try again",
                          });
                              //$('#success').html("")
                      },
                      processData:false,
                      contentType:false    
                   })
                })
            });
        </script>
    </body>
</html>
