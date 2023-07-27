
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.ss.helper.connection_provider"%>
<%@page import="com.ss.dao.notificationdao"%>
<%@page import="com.ss.entities.notification"%>
<%@page import="com.ss.entities.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    user u=(user)session.getAttribute("currentUser");
    String firstname = u.getFirstname();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notifications!!</title>
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
        <div class="container py-2 mt-2">
            <div class="card shadow">
                 <div class="card-header display-5 text-center " style="font-family: serif">Notifications</div>
                 <div class="card-content p-5">
                     <%
                         notificationdao nd = new notificationdao(connection_provider.getConnection());
                         List<notification> n1 = new ArrayList<>();
                         n1 = nd.getNotification(u.getEmail());
                         if(n1.size()==0)
                         {
                     %>
                     <div style="font-family: serif" class="display-6 text-center">No notification :( </div>
                     <%
                         }
                         else
                         {
                             for(notification n : n1)
                             {
                               if(n.getType().equals("Renter"))
{
                     %>
                               <div class="text-center dv" ><h3 style="font-family: serif" ><%= n.getN_content() %></h3>
                               <br>
                               <form action="notificationservlet" method="post" class="notification">
                                   <button type="button" onclick='notification(this.id,<%= n.getN_id()%>,this,"<%= n.getUser_to() %>","<%= n.getUser_from()%>",<%= n.getEvent_id()%>)' class="btn btn-success m-3 col-md-3" value="yes" name="action1" id="ans">Yes</button>
                          
                                   <button type="button" onclick='notification(this.id,<%= n.getN_id()%>,this,"<%= n.getUser_to() %>","<%= n.getUser_from()%>",<%= n.getEvent_id()%>)'class="btn btn-danger col-md-3"  value="no" name="action2" id="no">No</button>
                                </form>
                                <h3 style="font-family: serif;display: hidden" class="n"></h3>
                               <hr>
                                </div>
                               
                             
                     <%
                         }
else if(n.getType().equals("Organizer"))
{
%>
                     <div class="text-center dv" ><h3 style="font-family: serif" ><%= n.getN_content() %></h3>
                               <br>
                               <form action="notificationservlet" method="post" class="notification">
                                   <button type="button" onclick='notification(this.id,<%= n.getN_id()%>,this,"<%= n.getUser_to() %>","<%= n.getUser_from()%>",<%= n.getEvent_id()%>)' class="btn btn-success m-3 col-md-3" value="yes" name="action1" id="PAY">OK</button>=

                               </form>
                                <h3 style="font-family: serif;display: hidden" class="n"></h3>
                               <hr>
                                </div>
                     <%
}
                             }
                         }
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
           <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
           function notification(idb,f,e,to,from,event_id)
           {
//               let formid = document.getElementsByTagName('form');
//               let idid = document.getElementsByTagName('id');
//               var p =document.querySelector('.notification').id;
               
                       //$(".notification").find(".active").attr('id');
//               console.log(formid);
              
//               console.log(p);
//               console.log(idid);
//               //console.log(this.id);
//               console.log(idb);
//               var note = $("#"+idb).html();
//               console.log(note);
//               console.log(form);
               //$(formid).hide();
//               e.parentNode
                 let d = $("#"+idb).html();
                 console.log(d);
                 console.log(event_id);
                 if(d==='OK')
                 {
                     $.ajax({
                        url:"notificationservlet",
                        type:'POST',
                        data:{f:f,d:d,to:to,from:from,event_id:event_id},
                        success: function(data,textStatus,jqXHR)
                        {
                            console.log("pass");
                            if(data.trim()==='done')
                            {
                                console.log("listed");
                            }
                            else if(data.trim()==='notdone')
                            {
                                console.log("not listed");
                            }
                            else{
                                console.log(data);
                                console.log("hao");
                            }
                                
                        },
                        error: function(jqXHR,textStatus,errorThrown)
                        {
                            console.log("fail");
                            
                        },
                    
               })
                     console.log("yes it is pay");
                     swal("Proceed to Pay")
                          .then((value) => {
                          window.location="payment_gateway.jsp";
                                  });
                                  
                 }
                 else
                 {
               var j = e.parentNode.parentNode.id;
               console.log(j);
               $("#"+j).hide();
                //let form = new FormData(e.parentNode);
                   $.ajax({
                        url:"notificationservlet",
                        type:'POST',
                        data:{f:f,d:d,to:to,from:from,event_id:event_id},
                        success: function(data,textStatus,jqXHR)
                        {
                            console.log("pass");
                            if(data.trim()==='discard')
                            {
                                console.log("not ok");
                            }
                            else if(data.trim()==='accept')
                            {
                                console.log("ok");
                            }
                            else{
                                console.log(data);
                                console.log("hao");
                            }
                                
                        },
                        error: function(jqXHR,textStatus,errorThrown)
                        {
                            console.log("fail");
                            
                        },
                    
               })
           }
//               var m = $(e).closest("h3").attr('id');
//               console.log(m);
//               $()
           }
            $(document).ready(function()
           {
               var count=0;
               $(".notification").each(function(){
                   count = count+1;
                   $(this).attr("id","notification"+count);
               })
               var c=0;
               $(".dv").each(function(){
                   c = c+1;
                   $(this).attr("id","dv"+c);
               })
               var co=0;
               $(".n").each(function(){
                   co = co+1;
                   $(this).attr("id","n"+co);
               })
//                $("#notification").on("submit",function(event)
//                {
//                    event.preventDefault();
//                    var ans = $("#ans").html();
//                    console.log(ans);
//                    var no = $("#no").html();
//                    console.log(no);
//                    let form = new FormData(this);
//                    $.ajax({
//                        url:"notificationservlet",
//                        type:'POST',
//                        data:form,
//                        success: function(data,textStatus,jqXHR)
//                        {
//                            console.log("pass");
//                            if(data.trim()==='discard')
//                            {
//                                console.log("not ok");
//                            }
//                            else if(data.trim()==='accept')
//                            {
//                                console.log("ok");
//                            }
//                            else{
//                                console.log(data);
//                                console.log("hao");
//                            }
//                                
//                        },
//                        error: function(jqXHR,textStatus,errorThrown)
//                        {
//                            console.log("fail");
//                            
//                        },
//                        processData:false,
//                        contentType:false
//                    
//                    })
//                
//                })
            });
        </script>
    </body>
</html>
