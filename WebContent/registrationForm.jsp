<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SP Game Store</title>
<link rel="stylesheet" type="text/css" media="screen" href="styles.css" />
<%@ page import="java.sql.*" %>
<%@ page import="java.util.regex.*" %>
<%@page import="controller.*,model.*"%>
<script type="text/javascript" src="jquery.js"></script>
</head>
<body>

<div class="header">
	<img src="image/SP.png">
	<img id="head" src="image/Game-Store.png">
</div><br/><hr/>
<table border='0'>
	<tr>
	<td style="float:right;width:10%"><a class = "login" href="registrationForm.jsp">| Register</a></td>
	<td style="float:right;width:2%"><a class ="login" href="login.jsp">Login</a></td>
	</tr>
</table>
<%
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


<script type="text/javascript">
$('.myMenu ul li').hover(function() {
	$(this).children('ul').stop(true, false, true).slideToggle(300);
	
});






function validate(){
	var valid= false;
	var letters = /^[A-Za-z]+$/;
	var pa= document.reg.Password1;
	$('#nameerr').empty();
	$('#nameerr2').empty();
	$('#password1err').empty();
	$('#password2err').empty();
	$('#addresserr').empty();
	$('#emailerr').empty();
	$('#contacterr').empty();
	
	if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(reg.Email.value)) 
	  {
		valid= true  ;
	  }else{
	    alert("You have entered an invalid email address!") ; 
	    valid= false  ;
		} 
	
	if(document.reg.Name.value.length<3){
		document.getElementById('nameerr2').innerHTML="<span style='color:#FF0000'>Please enter a valid name</span>";
		valid=false;
		}
	else if (!/^[a-zA-Z]*$/g.test(document.reg.Name.value)) {
		document.getElementById('nameerr2').innerHTML="<span style='color:#FF0000'>Please enter a valid name</span>";
        valid=false;
    }
	
	if(document.reg.Name.value==""){
		document.getElementById('nameerr').innerHTML="<span style='color:#FF0000'>Please enter your name</span>";
		valid=false;
		}
	
	if(document.reg.Password1.value==""){
		document.getElementById('password1err').innerHTML="<span style='color:#FF0000'>Please enter your password</span>";
		valid=false;
		}
	
	if(document.reg.Password2.value==""){
		document.getElementById('password2err').innerHTML="<span style='color:#FF0000'>Please reenter your password</span>";
		valid=false;
		}
	
	if((pa.value).match(/^[A-Za-z]+$/) || pa.value.length<8 || pa.value.length>16){	
		alert("Passwords must be alphanumeric and must be longer than 7 but shorter than 17 characters!") ; 
		valid=false;
		}
	 

	if(document.reg.Password1.value !=document.reg.Password2.value){
		alert("Passwords do not match!") ; 
		valid=false;
		}
	
	if(document.reg.Address.value==""){
		document.getElementById('addresserr').innerHTML="<span style='color:#FF0000'>Please enter your address</span>";
		valid=false;
		}

	if(document.reg.Email.value==""){
		document.getElementById('emailerr').innerHTML="<span style='color:#FF0000'>Please enter your email</span>";
		valid=false;
		}
	
	if(document.reg.Contact.value==""){
		document.getElementById('contacterr').innerHTML="<span style='color:#FF0000'>Please enter your contact</span>";
		valid=false;
		}
	
	else if(isNaN(document.reg.Contact.value)|| document.reg.Contact.value.toString().length<8 || document.reg.Contact.value.toString().length>8){
		document.getElementById('contacterr').innerHTML="<span style='color:#FF0000'>Please enter a real contact!</span>";
		valid=false;
		}

	
	
	if (!valid){
		return false;
		}else {
		return true;
		}
	}
</script>

<br/>
<br/>
<h1>Registration</h1><br/>

<form action="addMemberServlet" name ="reg" id="reg"  method="get" onsubmit="return validate() ;">
Name:	<input type="text" name="Name"/><div id="nameerr"></div><div id="nameerr2"></div><br/>
Password:	<input type="password" name="Password1" id="Password"/><div id="password1err"></div><br/>
Re-Enter:	<input type="password" name="Password2" id="Password2"/><br/><span id="matching"></span><div id="password2err"></div><br/>
Address:	<input type="text" name="Address" id="Address"/><br/><div id="addresserr"></div><br/>
Email:	<input type="text" name="Email"/><div id="emailerr"></div><br/>
Contact:	<input type="text" name="Contact"/><div id="contacterr"></div><br/>

<input type="submit" value="Submit"/>


</form>
<script>
$('#Password, #Password2').on('keyup', function pass() {
	var error;
    if ($('#Password').val() == $('#Password2').val()) {
        $('#matching').html('Matching').css('color', 'green');
        error=false;
    } else {
        $('#matching').html('Not Matching').css('color', 'red');
   		 error=true;
    }
    if (error){
    	 false;
		}else {
		return true;
		}
});
</script>
</body>

</html>