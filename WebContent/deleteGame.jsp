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
		String connURL = "jdbc:mysql://127.0.0.1/assignment?user=root&password=s9812063g";
		Connection conn = DriverManager.getConnection(connURL);
		
		String id = request.getParameter("hiddenID");
		
		String sql = "delete from game where GameID=?";
		
        PreparedStatement pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		
		String sql2 = "delete from game_genre where GameID=?";
		PreparedStatement pstmt2=conn.prepareStatement(sql2);
		pstmt2.setString(1, id);
		int rs2 = pstmt2.executeUpdate();
		
		int rs = pstmt.executeUpdate();
		out.println(rs + " rows affected");
		out.println(rs2 + " rows affected");
	%>
	<script type="text/javascript">
$('.myMenu ul li').hover(function() {
	$(this).children('ul').stop(true, false, true).slideToggle(300);
});
	</script>
		<%conn.close();%>
</body>
</html>