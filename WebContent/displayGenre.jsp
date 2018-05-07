<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" media="screen" href="styles.css" />
<script type="text/javascript" src="jquery.js"></script>
<title>SP Game Store</title>
</head>
<body>
<%@include file="validateAdmin.jsp"%>
<div class="header">
	<img src="image/SP.png">
	<img id="head" src="image/Game-Store.png">
	<a class ="login" href="logout.jsp">Sign Out</a>
</div><hr/>

<div class="menuBackground">
	<div class="center myMenu">
		<ul class="dropDownMenu">
  <li><a href="adminindex.jsp">Home</a></li>
  <li><a href="tableAllGames.jsp">All Games</a></li>
  <li><a href="#">Add</a>
     <ul>
	<li><a href="newGameForm.jsp">New Game</a></li>
	<li><a href="NewGenre.jsp">New Genre</a>
	</ul>
  </li><li><a href="#">Update/ Delete</a>
     <ul>
	<li><a href="tableAllGames.jsp">Game</a></li>
	<li><a href="displayGenre.jsp">Genre</a>
	</ul>
  </li>

  <li><a href="stockReport.jsp">Stock Report</a></li>


</ul>
</div>
</div>

<br/>
<br/>

	<%
		Class.forName("com.mysql.jdbc.Driver");
		String connURL = "jdbc:mysql://jws-app-mysql:3306/assignment?user=user&password=password";
		Connection conn = DriverManager.getConnection(connURL); 
		
		
		
		String sql="select * from genre";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		out.println("<table border='1'>");
		out.println("<tr><td>GenreID</td><td>Genre</td><td>Update or Delete</td></tr>");
		
		while(rs.next()){
		int id = rs.getInt("GenreID");
		String genre = rs.getString("Genre");
		
		%>
		<tr>
		<td><%=id%></td>
		<td><%=genre %></td>
		<td>
		<form action="updateGenre.jsp" method= "get">
		<input type="submit" name="btnSubmit" value="Update Genre">
		<input type="hidden" name="hiddenID" value="<%=id%>">
		</form>
		<form action="deleteGenre.jsp" method= "get">
		<input type="submit" name="btnSubmit" value="Delete Genre">
		<input type="hidden" name="hiddenID" value="<%=id%>">
		</form>
		
		</td>
		</tr>
		
		<% 
		}
	%>
	<script type="text/javascript">
$('.myMenu ul li').hover(function() {
	$(this).children('ul').stop(true, false, true).slideToggle(300);
});
</script>
	<%conn.close();%>
</body>
</html>