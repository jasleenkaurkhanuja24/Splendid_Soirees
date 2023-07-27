<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ss.dao.auditoriumsdao"%>
<%@page import="com.ss.entities.auditoriums"%>
<%@page import="com.ss.helper.connection_provider"%>
<%@page import="com.ss.entities.user"%>
<%@page import="com.ss.dao.eventdao"%>
<%@page import="com.ss.entities.event"%>
<%
    user u=(user)session.getAttribute("currentUser");
    String firstname = u.getFirstname();
%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Events</title>
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
 #navbar {
  overflow: hidden;
  z-index: 1;
 
}
.sticky {
  position: fixed;
  top: 0px;
  width: 100%;
}

.sticky + .content {
  padding-top: 60px;
}
#navbar a {
    color: rgb(240, 174, 32);
/*  float: left;*/
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  font-size: 17px;
}

#navbar a:hover {
  background-color: #ddd;
  color: rgb(240, 174, 32);
}

#navbar a.active {
  background-color: #04AA6D;
  color: white;
}

.typewriter h1 {
    overflow: hidden; /* Ensures the content is not revealed until the animation */
    border-right: .15em solid orange; /* The typwriter cursor */
    white-space: nowrap; /* Keeps the content on a single line */
    margin: 0 auto; /* Gives that scrolling effect as the typing happens */
    letter-spacing: .15em; /* Adjust as needed */
    animation: 
      typing 3.5s steps(40, end),
      blink-caret .75s step-end infinite;
  }
  
 
/*@import url("https://fonts.googleapis.com/css2?family=Righteous&display=swap");
@import url('https://fonts.googleapis.com/css2?family=Merriweather:wght@300;900&display=swap');
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700;800&display=swap");*/
*{
  margin: 0;
  padding: 0;
  font-family: "Poppins", sans-serif;
  color: rgb(240, 174, 32);
}



/*TYPEWRITER FONT */

.typewriter h1 {
    overflow: hidden; /* Ensures the content is not revealed until the animation */
    border-right: .15em solid orange; /* The typwriter cursor */
    white-space: nowrap; /* Keeps the content on a single line */
    margin: 0 auto; /* Gives that scrolling effect as the typing happens */
    letter-spacing: .15em; /* Adjust as needed */
    animation: 
      typing 3.5s steps(40, end),
      blink-caret .75s step-end infinite;
  }

  /* The typing effect */
  @keyframes typing {
    from { width: 0 }
    to { width: 100% }
  }
  
  /* The typewriter cursor effect */
  @keyframes blink-caret {
    from, to { border-color: transparent }
    50% { border-color: orange; }
    
  }

/* cards */



 body {
   display: flex; 
  justify-content: center;
  align-items: center;
  flex-wrap: wrap;
  min-height: 100vh;
  background: white;
}

body .container {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-wrap: wrap;
  max-width: 1200px;
  margin: 40px 120px;
  color: rgb(240, 174, 32);
}

body .container .card{
  position: relative;
  min-width: 450px;
  min-height: 500px;
  box-shadow: inset 5px 5px 5px rgba(0, 0, 0, 0.2),
    inset -5px -5px 15px rgba(255, 255, 255, 0.1),
    5px 5px 15px rgba(0, 0, 0, 0.3), -5px -5px 15px rgba(255, 255, 255, 0.1);
  border-radius: 15px;
  margin: 30px;
  transition: 0.5s;
  color: rgb(240, 174, 32);
}

body .container .card:nth-child(1) .box .content a {
  background: #2196f3;
}

body .container .card:nth-child(2) .box .content a {
  background: #e91e63;
}

 body .container .card:nth-child(3) .box .content a {
  background: #23c186;
}

body .container  .box {
  position: absolute;
  top: 20px;
  left: 20px;
  right: 20px;
  bottom: 20px;
  background: #2a2b2f;
  border-radius: 15px;
  display: flex;
  justify-content: center;
  align-items: center;
  /*overflow: hidden;*/
  transition: 0.5s;
  color: rgb(240, 174, 32);
}

body   .box:hover {
  transform: translateY(-50px);
}

body .container .card .box:before {
  content: "";
  position: absolute;
/*  top: 0;
  left: 0;*/
  width: 50%;
  height: 100%;
  background: rgba(255, 255, 255, 0.03);
}

body  .card .box .content {
  padding: 20px;
  text-align: center;
  color: rgb(240, 174, 32);
}

body  .box .content h2 {
  position: absolute;
  top: -10px;
  right: 30px;
  font-size: 8rem;
  color: rgba(255, 255, 255, 0.1);
  color: rgb(240, 174, 32);
}

body  .box .content h3 {
  font-size: 1.8rem;
  color: #fff;
  z-index: 1;
  transition: 0.5s;
  margin-bottom: 15px;
  color: rgb(240, 174, 32);
}

body   .box .content p {
  font-size: 1rem;
  font-weight: 300;
  color: rgba(255, 255, 255, 0.9);
/*  z-index: 1;*/
  transition: 0.5s;
  color: rgb(240, 174, 32);
}

body   .box .content a {
  position: relative;
  display: inline-block;
  padding: 8px 20px;
  background: black;
  border-radius: 5px;
  text-decoration: none;
  color: white;
  margin-top: 20px;
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
  transition: 0.5s;
  color: rgb(240, 174, 32);
}

body .container .card .box .content a:hover {
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.6);
  background: #fff;
  color: #000;
  color: rgb(240, 174, 32);
}

/* button */

.glow-on-hover {
  width: 300px;
  height: 80px;
  border: none;
  outline: none;
  color: #fff;
  background: #111;
  cursor: pointer;
  position: relative;
  z-index: 0;
  border-radius: 30px;
  margin: 10px 20px;
  color: rgb(240, 174, 32);
}

.glow-on-hover:before {
  content: '';
  background: linear-gradient(45deg, #ff0000, #ff7300, #fffb00, #48ff00, #00ffd5, #002bff, #7a00ff, #ff00c8, #ff0000);
  position: absolute;
  top: -2px;
  left:-2px;
  background-size: 400%;
  z-index: -1;
  filter: blur(5px);
  width: calc(100% + 4px);
  height: calc(100% + 4px);
  animation: glowing 20s linear infinite;
  opacity: 0;
  transition: opacity .3s ease-in-out;
  border-radius: 10px;
  color: rgb(240, 174, 32);
}

.glow-on-hover:active {
  color: #000
}

.glow-on-hover:active:after {
  background: transparent;
}

.glow-on-hover:hover:before {
  opacity: 1;
}

.glow-on-hover:after {
  z-index: -1;
  content: '';
  position: absolute;
  width: 100%;
  height: 100%;
  background: #111;
  left: 0;
  top: 0;
  border-radius: 10px;
  color: rgb(240, 174, 32);
}

@keyframes glowing {
  0% { background-position: 0 0; }
  50% { background-position: 400% 0; }
  100% { background-position: 0 0; }
}
        </style>

  <link href="assets/css/style.css" rel="stylesheet">
    </head>
    <body style=" font: #eba934; ">
        <div class="">
            <div>
        <% if(u.getRole().equals("Organizer"))
           {
        %>
               <a href="notification.jsp" class="btn btn-secondary glow-on-hover" style="float: right;"><h2>Notification</h2></a>
               
         <%
           }
        %>
        </div></div>
        <div id="myCarousel" class="carousel slide container" data-ride="carousel">
    
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
 
      <div class="carousel-inner">
        <div class="item active">
          <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwmGA6wXjkd9qT0bE2o0v0jhtG9FD8rYKzOw&usqp=CAU" style="
          height: 650px;
          width: 100%" alt="Event Image Loading" />
   
          <div class="carousel-caption">
            <h1>
               <a href=""  class="typewrite" data-period="2000" data-type='[ "Grab your seats.", "Become an enthusiast learner", "Be a part of our magical events", "Explore more!" ]'>
                 <span class="wrap"></span>
               </a>
            </h1>
          </div>
        </div>
 
        <div class="item">
           <img src="https://png.pngtree.com/thumb_back/fh260/back_our/20190619/ourmid/pngtree-spring-sports-event-poster-background-material-image_138484.jpg" style=" height: 650px; width: 100%" alt="Event Image Loading">
          <div class="carousel-caption">
            <h1>
              <a href="" class="typewrite" data-period="2000" data-type='[ "HI There, it is splendid soirees", "I am Creative.", "I am a great learner", "Learn new things everyday" ]'>
                <span class="wrap"></span>
              </a>
           </h1>
          </div>
        </div>
 
        <div class="item">
           <img src="https://burst.shopifycdn.com/photos/celebrate-carnival-background.jpg?width=1200&format=pjpg&exif=1&iptc=1" style=" height: 650px; width: 100%" alt="Event Image Loading"/>
         <div class="carousel-caption">
          <h1>
            <a href="" class="typewrite" data-period="2000" data-type='[  "HI There, it is splendid soirees", "I am Creative.", "I am a great learner", "Learn new things everyday"]'>
              <span class="wrap"></span>
            </a>
          </h1>
         </div>
        </div>
    </div>
  </div>
  <!-- Left and right controls -->
  <div class="container">
     <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
     </a>
  </div>

  <!-- Cards -->
  <div class="container">
      <% if(u.getRole().equals("Organizer"))
           {
        %>
    <div class="card">
      <div class="box">
        <div class="content">
          <!-- <h2>01</h2> -->
          <h3>Organize an Event</h3>
          <p>Only for Organizers</p>
          <a href="organize_an_event.jsp">Fill in details</a>
        </div>
      </div>
    </div>
  
    <div class="card">
      <div class="box">
        <div class="content">
          <!-- <h2>02</h2> -->
          <h3>List out Auditorium</h3>
          <p>Choose auditorium with your convienence.</p>
          <a href="list_out_details.jsp">Fill in details</a>
        </div>
      </div>
    </div>
     <%
           }
        %>
</div>
    <!-- Buttons -->
    <div class="container" style="" id="" >
        <a href="#present" class="glow-on-hover  btn btn-outline-secondary ">PRESENT EVENTS</a>
        <a href="#upcoming" class="glow-on-hover  btn btn-outline-secondary ">UPCOMING EVENTS</a>
         <a href="#past" class="glow-on-hover  btn btn-outline-secondary ">PAST EVENTS</a>

      </div>
       <b class="display-4" class="text-left" style="text-align:left">Present Events</b><br>
         
       <div class="container">
             <!--<b class="display-4" class="" style="text-align:left">Present Events</b><br>-->
         <div id="present">
             <div class="row">
             <%
                 
                 eventdao edao1 = new eventdao(connection_provider.getConnection());
                 List<event> e = edao1.getpresenteventData();
                 if(e.size()==0)
             {
             %>
             <b class="display-4">No present events</b>
             <%
             }
             else{
                 for(event eve:e)
                 {    
                    if(eve.getEvent_permission()=="no" || eve.getEvent_permission().equals("no"))
                    {
                    
                    }
                    else
                    {
             %>
             
                 <div class="col-md-4 mt-2" >
                     <div class="card" style="margin:5px;">
                     <div class="card-header">
                         <%=
                             eve.getEvent_name()
                         %>
                         <br>
                         <div class="text-center"><img src = "assets/img/<%= eve.getEvent_pic()%>" class="card-img-top my-2 text-center " style="height:350px ;width:400px;">
                            </div>
                         <h6><%= eve.getInst_name() %></h6>
                     </div>
                     <div class="card-body">
                         <%= 
                         eve.getEvent_content()
                         %><br>
                         Time:
                         <%
                             out.print(eve.getEvent_date_from()+" " +eve.getEvent_time_from()+" - " + eve.getEvent_date_to()+" "+eve.getEvent_time_to());
                         %>
                     </div>
                     <div class="card-footer">
                         <a href="event_details.jsp?id=<%=eve.getEvent_id()%>" class="btn btn-secondary m-1">Get more details</a>
                         </div>
                 </div>
                     </div>
                         <%
                             }  
                             }}
                         %>
                     
             </div>
         </div>
            <hr>
            </div>
         <b class="display-4">Upcoming Events</b><br>
         <div class="container" style="display: ">
         <div  id="upcoming">
             <div class="row">
             <%
                 eventdao edao2 = new eventdao(connection_provider.getConnection());
                 
             List<event> ee = edao2.getupcomingeventData();
             if(ee.size()==0){
             %>
             <b class="display-4">No upcoming events</b>
             <%
                 }
             else{
                 for(event eve:ee)
                 {
                   
                    if(eve.getEvent_permission()=="no" || eve.getEvent_permission().equals("no"))
                    {
                    
                    }
                    else
                    {
             %>
             
                 <div class="col-md-4 mt-2">
                 <div class="card" style="margin:5px;">
                     <div class="card-header">
                         <%=
                             eve.getEvent_name()
                         %><br>
                         <div class="text-center"><img src = "assets/img/<%= eve.getEvent_pic()%>" class="card-img-top my-2 text-center " style="height:350px ;width:400px;">
                            </div>

                         <h6><%= eve.getInst_name() %></h6>
                     </div>
                     <div class="card-body">
                         
                         
                         <br>
                         <pre>Time:<%out.println("FROM: " + eve.getEvent_date_from()+" " +eve.getEvent_time_from());
                         out.print("TO: " + eve.getEvent_date_to()+" "+eve.getEvent_time_to());%></pre>
                     </div>
                     <div class="card-footer">
                          <a href="event_details.jsp?id=<%= eve.getEvent_id()%>" class="btn btn-secondary m-1">Get more details</a>
                         </div>
                 </div>
                     </div>
                         <%
                             }
                             
}}
                         %>
                         </div>
         </div></div> 
                    <hr>    
         <b class="display-4">Past Events</b>
         <div class="container">
         <div  id="past">
             <div class="row">
             <%
                 eventdao edao3 = new eventdao(connection_provider.getConnection());
                 
             List<event> eee = edao3.getpasteventData();
             if(eee.size()==0)
             {
             %>
             <b class="display-4">No past events</b>
             <%
             }
             else{
                 for(event eve:eee)
                 {
                   
                    if(eve.getEvent_permission()=="no" || eve.getEvent_permission().equals("no"))
                    {
                    
                    }
                    else
                    {
             %>
             
                 <div class="col-md-4 mt-2">
                 <div class="card" style="margin:5px;">
                     <div class="card-header">
                         <%=
                             eve.getEvent_name()
                         %><br><div class="text-center"><img src = "assets/img/<%= eve.getEvent_pic()%>" class="card-img-top my-2 text-center " style="height:350px ;width:400px;">
                            </div>

                         <h6><%= eve.getInst_name() %></h6>
                     </div>
                     <div class="card-body">
                         <%= 
                         eve.getEvent_content()
                         %><br>
                         Time:
                         <%
                             out.print(eve.getEvent_date_from()+" " +eve.getEvent_time_from()+" - " + eve.getEvent_date_to()+" "+eve.getEvent_time_to());
                         %>
                     </div>
                     <div class="card-footer">
                         
                         <a href="event_details.jsp?id=<%=eve.getEvent_id()%>" class="btn btn-secondary m-1">Get more details</a>
                         </div>
                 </div>
                     </div>
                         <%
                             }
                             }}
                         %>
         </div>
         </div>
         </div> </div>         
     
</div>
        
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script>
window.onscroll = function() {myFunction()};

var navbar = document.getElementById("navbar");
var sticky = navbar.offsetTop;

function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}
</script>
<script>
    var TxtType = function(el, toRotate, period) {
    this.toRotate = toRotate;
    this.el = el;
    this.loopNum = 0;
    this.period = parseInt(period, 10) || 2000;
    this.txt = '';
    this.tick();
    this.isDeleting = false;
};

TxtType.prototype.tick = function() {
    var i = this.loopNum % this.toRotate.length;
    var fullTxt = this.toRotate[i];

    if (this.isDeleting) {
    this.txt = fullTxt.substring(0, this.txt.length - 1);
    } else {
    this.txt = fullTxt.substring(0, this.txt.length + 1);
    }

    this.el.innerHTML = '<span class="wrap">'+this.txt+'</span>';

    var that = this;
    var delta = 200 - Math.random() * 100;

    if (this.isDeleting) { delta /= 2; }

    if (!this.isDeleting && this.txt === fullTxt) {
    delta = this.period;
    this.isDeleting = true;
    } else if (this.isDeleting && this.txt === '') {
    this.isDeleting = false;
    this.loopNum++;
    delta = 500;
    }

    setTimeout(function() {
    that.tick();
    }, delta);
};

window.onload = function() {
    var elements = document.getElementsByClassName('typewrite');
    for (var i=0; i<elements.length; i++) {
        var toRotate = elements[i].getAttribute('data-type');
        var period = elements[i].getAttribute('data-period');
        if (toRotate) {
          new TxtType(elements[i], JSON.parse(toRotate), period);
        }
    }
    // INJECT CSS
    var css = document.createElement("style");
    css.type = "text/css";
    css.innerHTML = ".typewrite > .wrap { border-right: 0.08em solid #fff}";
    document.body.appendChild(css);
};
</script><script>
var TxtType = function(el, toRotate, period) {
    this.toRotate = toRotate;
    this.el = el;
    this.loopNum = 0;
    this.period = parseInt(period, 10) || 2000;
    this.txt = '';
    this.tick();
    this.isDeleting = false;
};

TxtType.prototype.tick = function() {
    var i = this.loopNum % this.toRotate.length;
    var fullTxt = this.toRotate[i];

    if (this.isDeleting) {
    this.txt = fullTxt.substring(0, this.txt.length - 1);
    } else {
    this.txt = fullTxt.substring(0, this.txt.length + 1);
    }

    this.el.innerHTML = '<span class="wrap">'+this.txt+'</span>';

    var that = this;
    var delta = 200 - Math.random() * 100;

    if (this.isDeleting) { delta /= 2; }

    if (!this.isDeleting && this.txt === fullTxt) {
    delta = this.period;
    this.isDeleting = true;
    } else if (this.isDeleting && this.txt === '') {
    this.isDeleting = false;
    this.loopNum++;
    delta = 500;
    }

    setTimeout(function() {
    that.tick();
    }, delta);
};

window.onload = function() {
    var elements = document.getElementsByClassName('typewrite');
    for (var i=0; i<elements.length; i++) {
        var toRotate = elements[i].getAttribute('data-type');
        var period = elements[i].getAttribute('data-period');
        if (toRotate) {
          new TxtType(elements[i], JSON.parse(toRotate), period);
        }
    }
    // INJECT CSS
    var css = document.createElement("style");
    css.type = "text/css";
    css.innerHTML = ".typewrite > .wrap { border-right: 0.08em solid #fff}";
    document.body.appendChild(css);
};</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="assets/js/main.js"></script>
    </body>
</html>
