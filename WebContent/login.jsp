<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SP Game Store</title>
<link rel="stylesheet" type="text/css" media="screen" href="styles.css" />
<%@ page import="java.sql.*,model.*,controller.*" %>
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

</script>
<br/>
<br/>
<h1>Login</h1>
<form action="loginServlet" method="get">
LoginID :  <input type= "text" name= "loginID"/>
<br/>
<br/>
Password: <input type= "password" name="password"/>
<br/>
<br/>
<input type="submit" name="btnsubmit" value="login"/>


</form>

</body>
</html>