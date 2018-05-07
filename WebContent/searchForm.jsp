
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" media="screen" href="styles.css" />
	<script type="text/javascript" src="jquery.js"></script>
<title>SP Game Store</title>
</head>
<body>
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
Class.forName("com.mysql.jdbc.Driver");
String connURL = "jdbc:mysql://127.0.0.1/assignment?user=root&password=s9812063g";
Connection conn=DriverManager.getConnection(connURL);
String sql="Select * from genre";
PreparedStatement pstmt=conn.prepareStatement(sql);
ResultSet rs= pstmt.executeQuery();

String sql2="Select * from genre";
PreparedStatement pstmt2=conn.prepareStatement(sql2);
ResultSet rs2= pstmt2.executeQuery();

%>
<div class="menuBackground">
	<div class="center myMenu">
		<ul class="dropDownMenu">
  <li><a href="index.jsp">Home</a></li>
  <li><a href="allGames.jsp">Games</a></li>
  <li><a href="#">Genre</a>
     <ul>
	<%	while(rs.next()){%>
	<li><a href="showDetailGenre.jsp?hiddenID=<%=rs.getString(2) %>"><%= rs.getString(2)%></a></li>
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
<br/>
<form action="search.jsp" method="post">
<h2>Search:</h2><input type ="text" name="search"/>
<br/>
<br/>
Genre:
<select name='genre'>
<%while(rs2.next()){%>
<option  value='<%= rs2.getString(2)%>'><%= rs2.getString(2)%></option>
<% } %>
</select>
<br/>
<br/>
<input type="radio" name ="condition" id="condition" value="No">New
<input type="radio" name ="condition" id="condition" value="Yes">Pre-Owned
<br/>
<br/>
<input type="submit" value="Submit"/>


</form>
	<%conn.close();%>
</body>
</html>