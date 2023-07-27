
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
  <style>
      .bttnStyle{
          background-color: lightblue;
          border-radius: 0.50rem;
          border:1pc solid transparent;
      }
  </style>
  <script>
      var xhttp = new XMLHttpRequest();
      var RazorpayOrderId;
      function CreateOrderID(){
          console.log("in creteorserid function");
          xhttp.open("GET","http://localhost:8080/splendid-soirees/OrderCreation",true);
          xhttp.send();
          RazorpayOrderId = xhttp.responseText;
          OpenCheckout();
      }
  </script>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

    </head>
    <body>
        <div class="container">
            Pay an amount of: <br>
            
            <%
                String name = u.getFirstname() + u.getLastname();
                String emailid = u.getEmail();
            %>
            <input id="amount" type="text" class="form-control my-2" name="pay">
            <input type="hidden" id="name" value="<%= u.getFirstname()%><%= u.getLastname()%>"> 
            <input type="hidden" id="email" value="<%= u.getEmail()%>">
            <button id="payButton" onclick="CreateOrderID()" class="bttnStyle">Pay</button>
        </div>
        <script>
    
    function OpenCheckout(){
        console.log("in opencheckout");
        var amt=document.getElementById("amount").value;
        var name=document.getElementById("name").value;
        var emailid = document.getElementById("email").value;
        console.log(amt);
        console.log(name);
        console.log(emailid);
var options = {
"key": "rzp_test_TvUzjgsvhI2Zoq", // Enter the Key ID generated from the Dashboard
"amount": amt*100,
"currency": "INR",
"name": "Splendid Soirees",
"description": "Auditorium Payment",
"image": "assets/img/splendid soirees.png",
"order_id": RazorpayOrderId,
"handler": function (response){
console.log(response.razorpay_payment_id);
console.log(response.razorpay_order_id);
console.log(response.razorpay_signature)
console.log(response);
console.log("payment successful");
swal({
    text:"Payment done successfully",
    icon:"success", 
    button:"OK"
    });
},
"prefill": {
"name": name,
"email": emailid,
"contact": ""
},
"notes": {
"address": "Splendid Soirees"

},
"theme": {
"color": "#3399cc"
}
};
var rzp1 = new Razorpay(options);
console.log(rzp1);

rzp1.on('payment.failed', function (response){
console.log(response.error.code);
console.log(response.error.description);
console.log(response.error.source);
console.log(response.error.step);
console.log(response.error.reason);
console.log(response.error.metadata.order_id);
console.log(response.error.metadata.payment_id);
swal("Payment Failed.");
console.log(rzp1);

});
//rzp1.on('payment.p')
//if(rzp1.on('payment.failed')){
//    console.log("failed aaha");
//}
console.log(rzp1);
document.getElementById('payButton').onclick=function(e){
    console.log("in onclick state");
    rzp1.open();
    e.preventDefault();

}
    


//   }
}
</script>
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
  <script src="assets/vendor/php-email-form/validate.js"></script><!-- comment --><!-- Request server to create an order --> 
<!--   <script>
       const paymentStart=()=>{
         
         console.log("ok ji");
         let amount = $("#payment_amount").val();
         if(amount=='' || amount==null)
         {
             alert("Fill in the amount");
             return;
         }
         console.log(amount);
         //use ajax to send request to create order.
         $.ajax({
             url:'payment_servlet',
             data:amount,
             //contentType:'applicarion/json',
             type:'POST',
             //dataType:'json',
             success:function(response,textStatus,jqXHR){
                 console.log("success");
                 console.log(response);
             },
             error:function(jqXHR,textStatus,errorThrown){
                 
                 console.log("Something went wrong!!");
                 
             }
         })
       }
  </script>-->
<-<!--<script>
      $(document).ready(function(){
          console.log("hii");
          $("#payment_amount").on('submit',function(e){
//              e.preventDefault();
              let amount = new FormData(this);
              let amt = $("#amount").val();
               if(amt=='' || amt==null)
               {
                  alert("Fill in the amount");
                  return;
               }
               console.log(amt);
               $.ajax({
             url:"payment.jsp",
             data:JSON.stringify({amt:amt,info:'order_request'}),
             type:'POST',
             contentType:'applicarion/json',
             dataType:'json',
             success:function(response){
                 console.log("success");
                 console.log(response);
                 console.log(response.status);
                 if(response.status === "created")
                 {
                     console.log("in if");
                     let option={
                         key:'rzp_test_TvUzjgsvhI2Zoq',
                         amount:response.amount,
                         currency:'INR',
                         name:"Splendid Soirees",
                         description:'Auditorium Payment',
                         order_id:response.id,
                         handler : function(response)
                         {
                             console.log(response.razorpay_payment_id);
                             console.log(response.razorpay_order_id);
                             console.log(response.razor_signature);
                            alert("payment successful");  
                         },
                         prefill:{
                             name:"",
                             email:"",
                             contact:""
                         },
                         notes:{
                           address:"Splendid Soirees"
                         },
                         theme:{
                             color:"#3399cc"
                         }
                     };
                     let rpay = new RazorPay(option);
                     rpay.on("payment.failed",function(response){
                         console.log(response.error.code);
                         console.log(response.error.description);
                         console.log(response.error.source);
                         console.log(response.error.step);
                         console.log(response.error.reason);
                         console.log(response.error.metadata.order_id);
                         console.log(response.error.metadata.payment_id);
                         alert("payment failed");
                     });
                     rpay.open();
                 }   
             },
             error:function(error){
                 
                 console.log(error);
                 console.log("Something went wrong!!");
                 
             },
             processData:false,
             contentType:false
         })
        })
        });
  </script>-->
    </body>
</html>
