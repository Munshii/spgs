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

  <%
    String Genre= request.getParameter("hiddenID");
    String sql2 = "select * from game g, genre ge, game_genre gg where g.gameID=gg.gameID and gg.genreID=ge.genreID AND Genre=?";

	PreparedStatement pstmt2 = conn.prepareStatement(sql2);
	pstmt2.setString(1, Genre);
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
                        <form action="showDetailGame.jsp" method="get">
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

