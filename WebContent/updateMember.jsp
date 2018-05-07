<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="model.*,controller.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" media="screen" href="styles.css" />
<script type="text/javascript" src="jquery.js"></script>
<title>SP Game Store</title>
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

<br/>
<br/>

<h1>Update Member</h1>
	<%

		
		//String id = request.getParameter("hiddenID");
		//String id = "1";
	String id=(String)session.getAttribute("user");
	Member me =MemberUtility.selectMember(id);

	%>
	
	<form action = "updateMember" method="get" id="um">
	<div id="e">
	<label style="float:left; width:140px;">Name: </label>
	<input type="text" name ="name" size="20" value="<%=me.getName()%>"/><br/><br/>
	
	<label style="float:left; width:140px;">Password: </label>
	<input type="text" name ="password" size="20" value="<%=me.getPassword()%>"/><br/><br/>
	
	<label style="float:left; width:140px;">Address: </label>
	<input type="text" name ="address" size="40" value="<%=me.getAddress()%>"/><br/><br/>
	
	
	<label style="float:left; width:140px;">Email: </label>
	<input type="text" name ="email" size="20" value="<%=me.getEmail()%>" /><br/><br/>
	
	
	<label style="float:left; width:140px;">Contact: </label>
	<input type="text" name ="contact" size="20" value="<%=me.getContact()%>"/><br/><br/>
	<input type="hidden" name="hiddenID" value="<%=id%>" />
	<input type="submit" value="update"/>
	</div>

	   

	</form>
		<script type="text/javascript">
$('.myMenu ul li').hover(function() {
	$(this).children('ul').stop(true, false, true).slideToggle(300);
});
</script>
	
</body>
</html>