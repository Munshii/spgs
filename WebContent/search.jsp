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
String connURL = "jdbc:mysql://jws-app-mysql:3306/assignment?user=user&password=password";
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

<%


String GameTitle=request.getParameter("search");
String Genre=request.getParameter("genre");
String Condition=request.getParameter("condition");


String sql2="select GameTitle, g.GameID, Company, ReleaseDate, ImageLocation, Description, Price, PreOwned ,ge.genre from game g, game_genre gg, genre ge where g.GameID=gg.GameID and gg.genreID=ge.genreID and g.GameTitle like ? and ge.genre=? and g.PreOwned=? ";

PreparedStatement pstmt2=conn.prepareStatement(sql2);

pstmt2.setString(1,"%"+GameTitle+"%");
pstmt2.setString(2,Genre);
pstmt2.setString(3,Condition);
ResultSet rs2= pstmt2.executeQuery();


boolean hasRows = false;
%>

<div class="container">
				<div class="main">
				<% while(rs2.next()){
					hasRows = true;
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
                </div>  
                
			<% } %>
                </div>
                </div>
                
			

<%if(!hasRows){%>
<br/>
<br/>
<br/>
<br/>
	Sorry, there is no such game in this store.
<%} %>

<script type="text/javascript">
$('.myMenu ul li').hover(function() {
	$(this).children('ul').stop(true, false, true).slideToggle(300);
	
});
</script>
	<%conn.close();%>
</body>
</html>