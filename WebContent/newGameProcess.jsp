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
String GameTitle = request.getParameter("GameTitle");
String Company= request.getParameter("Company");
String ReleaseDate=request.getParameter("ReleaseDate");
String Description=request.getParameter("Description");
String Price=request.getParameter("Price");
String ImageLocation=request.getParameter("ImageLocation");
String [] Genre=request.getParameterValues("Genre");
String PreOwned=request.getParameter("PreOwned");
int Quantity=Integer.parseInt(request.getParameter("Quantity"));
int [] GenreID= new int [Genre.length];

Class.forName("com.mysql.jdbc.Driver");
String connURL = "jdbc:mysql://127.0.0.1/assignment?user=root&password=s9812063g";
Connection conn=DriverManager.getConnection(connURL);
String sql1="INSERT INTO game (GameTitle,Company,ReleaseDate,Description,Price,ImageLocation,PreOwned,Quantity) VALUES(?,?,?,?,?,?,?,?)";
PreparedStatement pstmt1=conn.prepareStatement(sql1);
pstmt1.setString(1,GameTitle);
pstmt1.setString(2,Company);
pstmt1.setString(3,ReleaseDate);
pstmt1.setString(4,Description);
pstmt1.setString(5,Price);
pstmt1.setString(6,ImageLocation);
pstmt1.setString(7,PreOwned);
pstmt1.setInt(8,Quantity);
int rs1= pstmt1.executeUpdate();



int GameID=0;
String sql2="select GameID from game where GameTitle=?";
PreparedStatement pstmt2=conn.prepareStatement(sql2);
pstmt2.setString(1,GameTitle);
ResultSet rs2= pstmt2.executeQuery();
while(rs2.next()){
	 GameID=rs2.getInt("GameID");
}
for (int i=0; i<Genre.length; i++){
String sql3="select genreID from genre where Genre=?";
PreparedStatement pstmt3=conn.prepareStatement(sql3);
pstmt3.setString(1, Genre[i]);
ResultSet rs3= pstmt3.executeQuery();
while(rs3.next()){
	GenreID [i]=rs3.getInt("genreID");
}
}
for (int i=0; i<Genre.length; i++){
String sql4="insert into game_genre values (?,?)";
PreparedStatement pstmt4=conn.prepareStatement(sql4);
pstmt4.setInt(1,GameID);
pstmt4.setInt(2,GenreID[i]);
pstmt4.executeUpdate();
}


out.println(rs1+" game added.");


%>
<script type="text/javascript">
$('.myMenu ul li').hover(function() {
	$(this).children('ul').stop(true, false, true).slideToggle(300);
});
</script>
	<%conn.close();%>
</body>
</html>