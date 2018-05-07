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

String GameID=request.getParameter("hiddenID");


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

<%


String sql="select GameTitle, Company, ReleaseDate, ImageLocation, Description, Price, PreOwned from game where GameID=? ";

PreparedStatement pstmt=conn.prepareStatement(sql);
pstmt.setString(1,GameID);
ResultSet rs= pstmt.executeQuery();

String sql2="select ge.Genre from game g, game_genre gg, genre ge where g.GameID=gg.GameID and gg.genreID=ge.genreID and g.GameID=?  ";


PreparedStatement pstmt2=conn.prepareStatement(sql2);
pstmt2.setString(1,GameID);
ResultSet rs2= pstmt2.executeQuery();


while(rs.next()){
	String Game=rs.getString("GameTitle");
	String Company=rs.getString("Company");
	Date ReleaseDate=rs.getDate("ReleaseDate"); 
	String Description=rs.getString("Description");
	Double Price=rs.getDouble("Price");
	String ImageLocation=rs.getString("ImageLocation");
	String PreOwned=rs.getString("PreOwned");
	%>
		<br/>
		<br/>
	<div id = gametable>
	<p id="gamefont"><%=Game %>
	</p>
	<img src="<%=ImageLocation%>">
	</p>
	<form action = "updateGame.jsp" id="ci">
	<input type= "submit" name="btnSubmit" value="Update">
	<input type= "hidden" name="hiddenID" value="<%=GameID%>">
	</form>
	<form action = "deleteGame.jsp" id="ci">
	<input type= "submit" name="btnSubmit" value="Delete">
	<input type= "hidden" name="hiddenID" value="<%=GameID%>">
	</form><br/>
	<p id="gamefont">
	<%="$" + Price %>
	</p>
	
	<p id="gamefont">Published by: <%=Company %>
	</p>
	<p id="gamefont">Genre: <%rs2.next();
	String Genre=rs2.getString("Genre");
	out.println(Genre+"\n");
	while(rs2.next()){
		String Genre1=rs2.getString("Genre");
		out.println(", "+Genre1);
	}
		%></p>
	<p id="gamefont">
	Released Date: <%=ReleaseDate %> 
	</p>	
	<p id="gamefont"><%=Description%> </p>
	</div>

		
	<% 
	
	
}
conn.close();
%>
</table>
<script type="text/javascript">
$('.myMenu ul li').hover(function() {
	$(this).children('ul').stop(true, false, true).slideToggle(300);
	
});
</script>

	<%conn.close();%>
</body>
</html>