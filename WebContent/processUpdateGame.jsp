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
   String title = request.getParameter("GameTitle");
   String company = request.getParameter("Company");
   String date = request.getParameter("ReleaseDate");
   String description = request.getParameter("Description");
   int price = Integer.parseInt(request.getParameter("Price"));
   String imageLoc = request.getParameter("ImageLocation");
   String preowned = request.getParameter("Preowned");
   int quantity = Integer.parseInt(request.getParameter("Quantity"));
   String [] Genre = request.getParameterValues("Genre");
   int [] GenreID = new int [Genre.length];
   
   String sql= "Update game set GameTitle=?, Company=?, ReleaseDate=? , Description=?, Price=?, ImageLocation=?, Preowned=?, Quantity=? where GameID=?";
		
   PreparedStatement pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, title);
   pstmt.setString(2, company);
   pstmt.setString(3, date);
   pstmt.setString(4, description);
   pstmt.setInt(5, price);
   pstmt.setString(6, imageLoc);
   pstmt.setString(7, preowned);
   pstmt.setInt(8, quantity);
   pstmt.setString(9, id);
   
   int rs = pstmt.executeUpdate();



   	

   	String sql3="Delete from game_genre where GameID=?";
    PreparedStatement pstmt3 = conn.prepareStatement(sql3);
    pstmt3.setString(1, id);
    int rs3= pstmt3.executeUpdate();
    out.println(rs3 + " rows affected");
   	
   	
  
   
   String [] Genre1=request.getParameterValues("Genre");
   int [] GenreID1= new int [Genre1.length];
   
   int GameID1= 0;
   String sql4 = "select GameID from game where GameTitle=?";
   PreparedStatement pstmt4 = conn.prepareStatement(sql4);
   pstmt4.setString(1, title);
   ResultSet rs4= pstmt4.executeQuery();
   while(rs4.next()){
	   GameID1 = rs4.getInt("GameID");
   }
   for(int i = 0; i< Genre1.length; i++){
	   String sql5 = "select GenreID from genre where Genre=?";
	   PreparedStatement pstmt5 = conn.prepareStatement(sql5);
	   pstmt5.setString(1, Genre1[i]);
	   ResultSet rs5 = pstmt5.executeQuery();
   while(rs5.next()){
	   GenreID1 [i] = rs5.getInt("GenreID");
   }
   }
   for(int i =0; i < Genre1.length; i++){
	   String sql6 = "insert into game_genre values(?,?)";
	   PreparedStatement pstmt6 = conn.prepareStatement(sql6);
	   pstmt6.setInt(1,GameID1);
	   pstmt6.setInt(2,GenreID1[i]);
	   pstmt6.executeUpdate();
   }
   
   out.println(rs + " rows affected/updated");
   
  
   
   
%>
	<script type="text/javascript">
$('.myMenu ul li').hover(function() {
	$(this).children('ul').stop(true, false, true).slideToggle(300);
});
</script>
	<%conn.close();%>
</body>
</html>