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
	<script src="jquery.blueberry.js"></script>
	

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


<script type="text/javascript">
$('.myMenu ul li').hover(function() {
	$(this).children('ul').stop(true, false, true).slideToggle(300);
	
});

$(window).load(function() {
	$('.blueberry').blueberry();
});
</script>
 <div class="blueberry">
      <ul class="slides">
        <li><img src="big/ac1.jpg"/></li>
        <li><img src="big/bld21.jpg" /></li>
        <li><img src="big/fallout1.jpg" /></li>
        <li><img src="big/hitman1.jpg" /></li>
      </ul>
    </div>



	<%conn.close();%>
</body>
</html>

