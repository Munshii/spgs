<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*" %>
      <%@ page import="java.text.SimpleDateFormat"%>
	<%@ page import="java.util.Date" %>
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
<br/>
<br/>

<script type="text/javascript">
$('.myMenu ul li').hover(function() {
	$(this).children('ul').stop(true, false, true).slideToggle(300);
	
});
</script>
<%
Date date = new Date();
SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
String DateNow=ft.format(date);
String Commentor = request.getParameter("Commentor");
String Comment = request.getParameter("Comment");
String Rating= request.getParameter("Rating");
String GameID=request.getParameter("hiddenID2");
String sql2="INSERT INTO comment (Commentor, Comment, Date, Rating, GameID) VALUES(?,?,?,?,?)";
PreparedStatement pstmt2=conn.prepareStatement(sql2);
pstmt2.setString(1,Commentor);
pstmt2.setString(2,Comment);
pstmt2.setString(3,DateNow);
pstmt2.setString(4,Rating);
pstmt2.setString(5, GameID);
int result= pstmt2.executeUpdate();
out.println(result+" commment created.");
%>

	<%conn.close();%>
</body>
</html>