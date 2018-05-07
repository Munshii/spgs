<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SP Game Store</title>
<link rel="stylesheet" type="text/css" media="screen" href="styles.css" />
<%@ page import="java.sql.*" %>
<%@ page import="java.util.regex.*" %>
<%@page import="model.*,controller.*,java.util.*"%>

<script type="text/javascript" src="jquery.js"></script>
</head>
<body>
<%@include file="validateAdmin.jsp"%>
<div class="header">
	<img src="image/SP.png">
	<img id="head" src="image/Game-Store.png">
	<a class ="login" href="logout.jsp">Sign Out</a></div><hr/>
<%
String []genre=MemberUtility.getGenre();
int i=0;


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
ArrayList<Game> games =(ArrayList<Game>)request.getAttribute("result");
%>
<br/><br/>
<h1>Stock Report</h1><br/>

<table id ="quantity"border='2'>
<tr>
<th>Game</th>
<th>Price</th>
<th>Quantity</th>
</tr>
<tr>
<%for(Game g: games){ %>
	<td><%=g.getGameTitle() %></td>
	<td><%=g.getPrice() %></td>
	<td><%=g.getQuantity() %></td>
</tr>
<%} %>

</table>

</body>
</html>