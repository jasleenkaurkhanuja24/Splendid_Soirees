
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ss.helper.Message"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
<!--        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">-->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

  <link href="assets/css/style.css" rel="stylesheet">
  <style>
@import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');

* {
	box-sizing: border-box;
}

body {
	background: #f6f5f7;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	font-family: 'Montserrat', sans-serif;
	height: 100vh;
	margin: -20px 0 50px;
}

h1 {
	font-weight: bold;
	margin: 0;
}

h2 {
	text-align: center;
}

p {
	font-size: 14px;
	font-weight: 100;
	line-height: 20px;
	letter-spacing: 0.5px;
	margin: 20px 0 30px;
}

span {
	font-size: 12px;
}

a {
	color: #333;
	font-size: 14px;
	text-decoration: none;
	margin: 15px 0;
}
.btn{
    border-radius: 20px;
	border: 1px solid white;
	background-color: #e99f01;
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	padding: 12px 45px;
	letter-spacing: 1px;
	text-transform: uppercase;
	transition: transform 80ms ease-in;
}
button {
	border-radius: 20px;
	border: 1px solid #e99f01;
	background-color: #e99f01;
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	padding: 12px 45px;
	letter-spacing: 1px;
	text-transform: uppercase;
	transition: transform 80ms ease-in;
}

button:active {
	transform: scale(0.95);
}

button:focus {
	outline: none;
}

button.ghost {
	background-color: transparent;
	border-color: #FFFFFF;
}

form {
	background-color: #FFFFFF;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 50px;
	height: 100%;
	text-align: center;
}

input {
	background-color: #eee;
	border: none;
	padding: 12px 15px;
	margin: 8px 0;
	width: 100%;
}

.container {
	background-color: #fff;
	border-radius: 10px;
  	box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22);
	position: relative;
	overflow: hidden;
	width: 768px;
	max-width: 100%;
	min-height: 480px;
}

.form-container {
	position: absolute;
	top: 0;
	height: 100%;
	transition: all 0.6s ease-in-out;
}

.sign-in-container {
	left: 0;
	width: 50%;
	z-index: 2;
}

.container.right-panel-active .sign-in-container {
	transform: translateX(100%);
}

.sign-up-container {
	left: 0;
	width: 50%;
	opacity: 0;
	z-index: 1;
}

.container.right-panel-active .sign-up-container {
	transform: translateX(100%);
	opacity: 1;
	z-index: 5;
	animation: show 0.6s;
}

@keyframes show {
	0%, 49.99% {
		opacity: 0;
		z-index: 1;
	}
	
	50%, 100% {
		opacity: 1;
		z-index: 5;
	}
}

.overlay-container {
	position: absolute;
	top: 0;
	left: 50%;
	width: 50%;
	height: 100%;
	overflow: hidden;
	transition: transform 0.6s ease-in-out;
	z-index: 100;
}

.container.right-panel-active .overlay-container{
	transform: translateX(-100%);
}

.overlay {
	background: #e99f01;
	background: -webkit-linear-gradient(to right, #edc607, #e99f01);
	background: linear-gradient(to right, #edc607, #e99f01);
	background-repeat: no-repeat;
	background-size: cover;
	background-position: 0 0;
	color: #000000;
	position: relative;
	left: -100%;
	height: 100%;
	width: 200%;
  	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.container.right-panel-active .overlay {
  	transform: translateX(50%);
}

.overlay-panel {
	position: absolute;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 40px;
	text-align: center;
	top: 0;
	height: 100%;
	width: 50%;
	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.overlay-left {
	transform: translateX(-20%);
}

.container.right-panel-active .overlay-left {
	transform: translateX(0);
}

.overlay-right {
	right: 0;
	transform: translateX(0);
}

.container.right-panel-active .overlay-right {
	transform: translateX(20%);
}

.social-container {
	margin: 20px 0;
}

.social-container a {
	border: 1px solid #DDDDDD;
	border-radius: 50%;
	display: inline-flex;
	justify-content: center;
	align-items: center;
	margin: 0 5px;
	height: 40px;
	width: 40px;
}

footer {
    background-color: #000000;
    color: #e99f01;
    bottom: 0;
    position: fixed;
    left: 0;
    right: 0;
    text-align: center;
    z-index: 999;
}

footer p {
    margin: 10px 0;
    font-size: 15px;
}

  </style>
    </head>
    <body>
<!--        <main class="d-flex align-items-center log banner-background" style="height: 90vh;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 offset-lg-4">
                        <div class="card log">
                            <div class="card-header">-->
<div class="container" id="container">
	<div class="form-container sign-in-container">
		<form action="login_details" method="post">
			<h1 style="padding: 20px;">Log in</h1>
                                
                                
                            
                            <%
                                    Message m = (Message)session.getAttribute("msg");
                                    if(m!=null)
                                    {
                                %>
                                <div class="alert <%= m.getCssclass()%>" role="alert">
                                    <%= m.getContent()%>
                                </div>
                                <%
                                    session.removeAttribute("msg");
                                    }
                                %>

                                <input type="email" name="email" placeholder="Email" />
			
				<input type="password" name="password" placeholder="Password" class="form-control"/>
			<small id="emailhelp" style="font-size:12px;">We'll never share your email or password with anyone else.</small>
			<p> Forgot <a href="forgot_password.jsp" style="color : #e99f01;">password</a>?</p>
			
			<button type="submit" class="btn btn-outline-primary" style="margin: 3px" id="submit-id">Log-In</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Welcome Back!</h1>
				<p>To keep connected with us please login with your personal info</p>
				<button class="ghost" id="signIn">Log In</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Hello, Buddy!</h1>
				<p>Do not have an account, Sign Up Now!!</p>
				<a href ="signup.jsp" class="ghost btn" id="signUp">SIGN UP</a>
			</div>
		</div>
	</div>
</div>

<footer>
	<p>
		Created with by Splendid Soirees
    </p>
</footer>
<!--                            <div class="card-body">
                                <form action="login_details" method="post" >
                                    Email Id<input type="email" name="email" class="form-control" placeholder="Enter emailid">
                                    Password<input type="password" name="password" class="form-control" placeholder="Enter Password" >
                                    <small id="emailhelp" style="font-size:12px;">We'll never share your email or password with anyone else.</small>
                                    <br>
                                    
                                    <button type="submit" class="btn btn-outline-primary" style="margin: 3px" id="submit-id">Log-In</button>
                                    <div class="text-center"><a href="forgot_password.jsp"  style=" color: #3300ff;font-size: 10px;text-decoration: underline">FORGOT PASSWORD</a></div>
                                    
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
        </main>-->
<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <script src="assets/js/main.js"></script>
    </body>
    </body>
</html>
