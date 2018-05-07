<%@page import="model.*, java.util.*" %>
<%@ page import="java.util.Date" %>
  <%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
	<!--[if lt IE 9]>
      <script src="scripts/semantic.js"></script>
    <![endif]-->
	<title>SP Game Store</title>
	<link rel="stylesheet" type="text/css" media="screen" href="styles.css" />
	<%@ page import="java.sql.*" %>
	<script type="text/javascript" src="jquery.js"></script>
	<script src="jquery.blueberry.js"></script>
	<script type="text/javascript">
	function validate(){
		var valid = true;
		$('#carderr').empty();
		$('#codeerr').empty();
	if(document.abc.cardnumber.value==""){
		document.getElementById('carderr').innerHTML="<span style='color:#FF0000'>Invalid card number</span>";
		valid=false;
	}else if(isNaN(document.abc.cardnumber.value)|| document.abc.cardnumber.value.toString().length<16 || document.abc.cardnumber.value.toString().length>16){
		document.getElementById('carderr').innerHTML="<span style='color:#FF0000'>Invalid card number</span>";
		valid=false;
	}
	
	if(document.abc.code.value==""){
		document.getElementById('codeerr').innerHTML="<span style='color:#FF0000'>Invalid code</span>";
		valid=false;
	}else if(isNaN(document.abc.code.value)|| document.abc.code.value.toString().length<3 || document.abc.code.value.toString().length>3){
		document.getElementById('codeerr').innerHTML="<span style='color:#FF0000'>Invalid code</span>";
		valid=false;
	}
	
	if (!valid){
		return false;
		}else {
		return true;
		}
	
	}
	</script>

</head>
<body>
<%@include file="validate.jsp"%>
<%

 ArrayList<Cart> cart = (ArrayList<Cart>)session.getAttribute("display");
String id = (String)session.getAttribute("user");
 
 //if(cart ==null){
	// out.println("No cart items!");
 //} 

%>
<div class="header">
	<img src="image/SP.png">
	<img id="head" src="image/Game-Store.png">
</div><hr/>
<%
String name=(String)session.getAttribute("name");
if(name!=null){%>
		<table border='0'>
	<tr>
	<td style="float:right;width:10%"><a class ="login" href="logout.jsp">| Logout</a> </td>
	<td style="float:right;width:2%"><a class = "login" href="viewProfile.jsp"><%=name %></a></td>
	</tr>
	</table>
	<%}else{ %>
	
	<table border='0'>
	<tr>
	<td style="float:right;width:10%"><a class = "login" href="registrationForm.jsp">| Register</a></td>
	<td style="float:right;width:2%"><a class ="login" href="login.jsp">Login</a></td>
	</tr>
	</table>	
	 <%} %>
<%
String GameID=request.getParameter("hiddenID");
String []genre=MemberUtility.getGenre();
int i=0;

%>
<div class="menuBackground">
	<div class="center myMenu">
		<ul class="dropDownMenu">
  <li><a href="index.jsp">Home</a></li>
  <li><a href="allGames.jsp">Games</a></li>
  <li><a href="#">Genre</a>
     <ul>
	<%	while(i<genre.length){%>
	<li><a href="showDetailGenre.jsp?hiddenID=<%=genre[i] %>"><%= genre[i]%></a></li>
	<%i++; %>
	<% } %>

    </ul>
  </li>
  <li><a href="searchForm.jsp">Search</a></li>


</ul>
</div>
</div>
</p>
<div id="cartTable">
<table border ='0' style="width:95%">
	
	<tr><p id="gamefont">Order Summary <hr style="height:1px;border-width:0;color:gray;background-color:white"></tr>
   <th style="text-align:left;width:22%">Game</th>
    <th style="text-align:left;width:16%">Price</th>
    <th style="text-align:left;width:21%">Quantity</th>
 
 	 <% 
 	double itemprice = 0;
 	double sum = 0; 
    for(Cart c : cart){
    	itemprice = c.getPrice() * c.getQuantity();
    	sum+= c.getPrice() * c.getQuantity();
    	%>
    	<tr>
    	<td style="text-align:left"><%=c.getGameTitle() %></td>
    	<td style="text-align:left"><%="$"+itemprice%></td>
    	<td style="text-align:left"><%=c.getQuantity() %></td>
    	</tr>
    	<%
    }
    	%>
</table>
   

    <hr style="height:1px;border-width:0;color:gray;background-color:white"></tr>
    <table border ='0' style="width:95%">
    <td style="text-align:left;font-size:22px;width:34.7%">SubTotal:</td>
    <td style="text-align:left;font-size:22px;width:58%">
    $<%=sum%>
    </table>
    </div>
    <br/>
    
    
    <form action="checkoutServlet" name="abc" id="abc" onsubmit="return validate();">
    <div id="cartTable">
    <p id="gamefont">Checkout<hr style="height:1px;border-width:0;color:gray;background-color:white">
    <div id = "details">
    <p style="font-size:20px"><b>Personal details:</b>
    <% 
    Member mem = MemberUtility.selectMember(id);
    %>
    <p style="font-size:18px">Full Name: <%=mem.getName()%>
    </br>
    <p style="font-size:18px">Email address: <%=mem.getEmail() %>
    </br>
    <p style="font-size:18px">Phone number : <%=mem.getContact() %>
    </br>
    <p style="font-size:18px">Address: <%=mem.getAddress() %>
    </div>
    </p>
    Please select a payment method:
    <br/>
    <select name="method">
			<option value="1">Visa</option>
			<option value="2">MasterCard</option>
			<option value="3">PayPal</option>
			<option value="4">American Express</option>
		</select>
		</p>

	 
	Card Number:</br>
    <input type="text" name="cardnumber" id="cardnumber" style="width:40%"><div id="carderr"></div>
	</p>
    
    Security code:</br>
    <input type="text" name="code" id="code" style="width:20%"><div id="codeerr"></div>
	</p>
	
	Expiry Date:</br>
	
	<select name="expiry">
	<option value="1">Jan</option>
    <option value="2">Feb</option>
	<option value="3">March</option>
	<option value="4">April</option>
	<option value="1">May</option>
	<option value="2">Jun</option>
	<option value="3">Jul</option>
	<option value="4">Aug</option>
	<option value="1">Sep</option>
	<option value="2">Oct</option>
	<option value="3">Nov</option>
	<option value="4">Dec</option>
	</select>
	<select name="expiry">
	<option value="1">2016</option>
    <option value="2">2017</option>
	<option value="3">2018</option>
	<option value="4">2019</option>
	<option value="1">2020</option>
	<option value="2">2021</option>
	<option value="3">2022</option>
	<option value="4">2023</option>
	<option value="1">2024</option>
	<option value="2">2025</option>
	<option value="3">2026</option>
	<option value="4">2027</option>
	</select>
	
    <p/>
    </br>
    <input type="submit" value="Checkout">
    
    </div>
    
    </form>
<script type="text/javascript">
$('.myMenu ul li').hover(function() {
	$(this).children('ul').stop(true, false, true).slideToggle(300);
	
});
	</script>
</body>
</html>

