<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
	<!--[if lt IE 9]>
      <script src="scripts/semantic.js"></script>
    <![endif]-->
	<title>SP Game Store</title>
	<link rel="stylesheet" type="text/css" media="screen" href="styles.css" />
	<%@ page import="java.sql.*" %>
	<script type="text/javascript" src="jquery.js"></script>

	

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
<br/>


<script type="text/javascript">
$('.myMenu ul li').hover(function() {
	$(this).children('ul').stop(true, false, true).slideToggle(300);
	
});

</script>

    <%
    String sql2 = "select * from game";

	PreparedStatement pstmt2 = conn.prepareStatement(sql2);

	ResultSet rs2 = pstmt2.executeQuery();
	
		
			%>
			
	
			
			
			<div class="container">
				<div class="main">
		<% while(rs2.next()){
			String image=rs2.getString("ImageLocation");
			String title = rs2.getString("GameTitle");
			int price  = rs2.getInt("Price"); 
			int id = rs2.getInt("GameID");
			%>
                <div class="view view-first">
                    <img src=<%=image %> />
                    <div class="mask">
                        <h2><%=title %></h2>
                        <p id="a"><%="S$" + price %></p>
                        <form action="showDetailGameAdmin.jsp" method="get">
			<input type="submit" name="btnSubmit" class="button" value="Details">
			<input type="hidden" name="hiddenID" value="<%=id%>" />
			</form>
                        
                    </div>
                </div>  <% } %>
                </div>
                </div>
          
	<%conn.close();%>
</body>
</html>

