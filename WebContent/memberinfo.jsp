<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SP Game Store</title>
<link rel="stylesheet" type="text/css" media="screen" href="styles.css" />
<%@ page import="java.sql.*" %>
<%@ page import="java.util.regex.*" %>
<%@page import="model.*,controller.*"%>
<script type="text/javascript" src="jquery.js"></script>
</head>
<body>
<%@include file="validate.jsp"%>
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
<br/><br/>
<h1>Member Details</h1>
<%Member m=(Member)request.getAttribute("memberdetails");%>
<br/><br/><br/><br/>
<%out.println("Name: "+m.getName());%><br/><br/>
<%out.println("Address: "+m.getAddress());%><br/><br/>
<%out.println("Email: "+m.getEmail());%><br/><br/>
<%out.println("Contact: "+m.getContact());%><br/><br/>





</body>
</html>