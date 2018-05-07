<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
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

<h1>Update Game</h1>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		String connURL = "jdbc:mysql://127.0.0.1/assignment?user=root&password=s9812063g";
		Connection conn = DriverManager.getConnection(connURL);
		
		String id = request.getParameter("hiddenID");
		
		//String sql = "select g.GameID, GameTitle, Company, ReleaseDate, Description, Price, ImageLocation, PreOwned, ge.genre from game g,game_genre gg, genre ge where g.GameID=gg.GameID and gg.GenreID=ge.GenreID and g.gameID=?";
        String sql="select * from game where GameID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);

		ResultSet rs = pstmt.executeQuery();
		
		String sql2 = "select * from genre";
		PreparedStatement pstmt2 = conn.prepareStatement(sql2);
		ResultSet rs2 = pstmt2.executeQuery();
		
		rs.next();
		String title = rs.getString("GameTitle");
		String company = rs.getString("Company");
		String date = rs.getString("ReleaseDate");
		String description = rs.getString("Description");
		int price = rs.getInt("Price");
		String imageLoc = rs.getString("ImageLocation");
		String preowned = rs.getString("PreOwned");
		int quantity = rs.getInt("Quantity");
		

		String sql3="select ge.Genre from game g, game_genre gg, genre ge where g.GameID=gg.GameID and gg.genreID=ge.genreID and g.GameID=?  ";


		PreparedStatement pstmt3=conn.prepareStatement(sql3);
		pstmt3.setString(1,id);
		ResultSet rs3= pstmt3.executeQuery();
	%>
	
	<form action = "processUpdateGame.jsp" method="get" id="nice">
	<div id="e">
	<label style="float:left; width:140px;">Game Title: </label>
	<input type="text" name ="GameTitle" size="25" value="<%=title%>"/><br/>
	
	<label style="float:left; width:140px;">Company: </label>
	<input type="text" name ="Company" size="25" value="<%=company%>"/><br/>
	
	
	<label style="float:left; width:140px;">Release Date: </label>
	<input type="text" name ="ReleaseDate" size="25" value="<%=date%>" /><br/>
	
	
	<label style="float:left; width:140px;">Description: </label>
	<textarea name ="Description" rows="6" cols="50"/><%=description%></textarea><br/>
	
	<label style="float:left; width:140px;">Price: </label>
	<input type="text" name ="Price" size="25" value="<%=price%>"/><br/>
	
	<label style="float:left; width:200px;">Image Location: </label>
	<input type="text" name ="ImageLocation" size="25"  value="<%=imageLoc%>"/><br/>
	
	<label style="float:left; width:140px;">PreOwned: </label>
	<input type="text" name ="Preowned" size="25"  value="<%=preowned%>"/><br/>
	
	<label style="float:left; width:140px;">Quantity: </label>
	<input type="text" name ="Quantity" size="25"  value="<%=quantity%>"/><br/>
	<br/>
	<div id="checkbox">Genre:<br/>
	</div>
	<%	
	rs3.last();
	int length=rs3.getRow();
	rs3.beforeFirst();
	String gamegenre[]= new String[length];
	rs2.last();
	int length2=rs2.getRow();
	rs2.beforeFirst();
	String genre[]=new String[length2];
	int i=0;
	while(rs3.next()){		
		gamegenre[i] = rs3.getString("Genre");	
		i++;
	}
	int k=0;
	boolean toprint= false;
	while(rs2.next()){
		genre[k] = rs2.getString("Genre");
		k++;
	}
	
		for(k=0; k<genre.length; k++){
			for(i=0;i<gamegenre.length;i++){
				if(genre[k].equals(gamegenre[i])){					
					toprint=true;
				}
			}
					%>				

			
				<input type="checkbox" name="Genre" value="<%=genre[k] %>" <% if(toprint){out.println("checked");}%>> <%=genre[k]%><br><%
				toprint=false;
		}
		
	 %>
	<br/>
	  <input type="submit" value="Update">
	  </div>
	   <input type="hidden" name="hiddenID" value="<%=id%>" />

	</form>
		<script type="text/javascript">
$('.myMenu ul li').hover(function() {
	$(this).children('ul').stop(true, false, true).slideToggle(300);
});
</script>
	<%conn.close();%>
</body>
</html>