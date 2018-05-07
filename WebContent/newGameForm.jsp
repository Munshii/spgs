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
<%@include file="validateAdmin.jsp"%>
<div class="header">
	<img src="image/SP.png">
	<img id="head" src="image/Game-Store.png">
	<a class ="login" href="logout.jsp">Sign Out</a>
</div><hr/>
<%
Class.forName("com.mysql.jdbc.Driver");
String connURL = "jdbc:mysql://127.0.0.1/assignment?user=root&password=s9812063g";
Connection conn=DriverManager.getConnection(connURL);



%>
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




<script type="text/javascript">
$('.myMenu ul li').hover(function() {
	$(this).children('ul').stop(true, false, true).slideToggle(300);
	
});

</script>
<%

String sql2="Select * from genre";
PreparedStatement pstmt2=conn.prepareStatement(sql2);
ResultSet rs2= pstmt2.executeQuery();


%>
<div id="newgame">
<form action="newGameProcess.jsp" id="nice">
		<h1>Add New Game</h1>

		Game Title:<br/> <input type="text" name="GameTitle"/> 
		<br/>
		Company Name:<br/> <input type="text" name="Company"/>
		<br/>
		Release Date:<br/> <input type="text" name="ReleaseDate"/>
		<br/>
		Description:<br/> <input type="text" name="Description"/>
		<br/>
		Price:<br/> <input type="text" name="Price"/>
		<br/>
		Image Location:<br/> <input type="text" name="ImageLocation"/>
		<br/>
		Pre Owned?<br/> <input type="text" name="PreOwned"/>
		<br/>
		Quantity:<br/> <input type="text" name="Quantity"/>
		<br/>
		Genre: <br/>
		<div id="checkbox">
	<%	while(rs2.next()){%>
	<input type="checkbox" id="ck" name="Genre" value="<%= rs2.getString(2)%>"><%= rs2.getString(2)%><br>
	<% } %>
		</div>
		<br/>
        <input type="submit" name="btnSubmit" value="Submit">


	</form>
</div>
	<%conn.close();%>
</body>
</html>