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
String connURL = "jdbc:mysql://127.0.0.1/assignment?user=root&password=s9812063g";
Connection conn=DriverManager.getConnection(connURL);
//Connection conn = DBConn.getConnection();

String GameID=request.getParameter("hiddenID");

String sql4="Select * from genre ";
PreparedStatement pstmt4=conn.prepareStatement(sql4);
ResultSet rs4= pstmt4.executeQuery();

%>
<div class="menuBackground">
	<div class="center myMenu">
		<ul class="dropDownMenu">
  <li><a href="index.jsp">Home</a></li>
  <li><a href="allGames.jsp">Games</a></li>
  <li><a href="#">Genre</a>
     <ul>
	<%	while(rs4.next()){%>
	<li><a href="showDetailGenre.jsp?hiddenID=<%=rs4.getString(2) %>"><%= rs4.getString(2)%></a></li>
	<% } %>

    </ul>
  </li>
  <li><a href="searchForm.jsp">Search</a></li>


</ul>
</div>
</div>





<%
String sql="select GameTitle, Company, ReleaseDate, ImageLocation, Description, Price, PreOwned, Quantity from game where GameID=? ";

PreparedStatement pstmt=conn.prepareStatement(sql);
pstmt.setString(1,GameID);
ResultSet rs= pstmt.executeQuery();

String sql2="select ge.Genre from game g, game_genre gg, genre ge where g.GameID=gg.GameID and gg.genreID=ge.genreID and g.GameID=?  ";


PreparedStatement pstmt2=conn.prepareStatement(sql2);
pstmt2.setString(1,GameID);
ResultSet rs2= pstmt2.executeQuery();

String PreOwned= "Yes";

	rs.next();
	String Game=rs.getString("GameTitle");
	String Company=rs.getString("Company");
	Date ReleaseDate=rs.getDate("ReleaseDate"); 
	String Description=rs.getString("Description");
	Double Price=rs.getDouble("Price");
	String ImageLocation=rs.getString("ImageLocation");
 	PreOwned=rs.getString("PreOwned");
 	int quantity=rs.getInt("Quantity");
	%>
	<br/>
	<br/>
	<%if(name!=null){%>
	<div class="viewcart">
	<a href="displayCart.jsp">
	<image src="image\viewcart.jpg" /></a>
	 </div>
	<%} %>
	<div id = gametable>
	<p id="gamefont"><%=Game %>
	</p>
	<img src="<%=ImageLocation%>">
	</p>
	<%if(name!=null){%>
	
	<form action="displaycart">
	<input type="image" src="image\add2cartbutton.jpg" value="submit"/>
	<input type="hidden" value="<%=Game %>" name="hiddenID1">
	
	</form>
	<%} %>
	<p id="gamefont">
	Price: <%="$" + Price %>
	</p>
	<p id="gamefont">
	Quantity: <%=quantity %>
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
	
<% if(PreOwned.equals("No")){%>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<div id="comment">
		<form action="CommentProcess.jsp" id="nice">
		<h2>Comments</h2>

		Your Name: <input type="text" name="Commentor"> <p>
		Comments:<br>
		<textarea name="Comment" rows="6" cols="50"></textarea>
		<br> Ratings: <select name="Rating">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select>
        </p>
        <input type="submit" name="btnSubmit" value="Submit">
        <input type="hidden" name="hiddenID2" value="<%=GameID%>" />
        <input type="hidden" name="hiddenID3" value="<%=GameID%>" />
        


	</form>
	<br/>
	</div>
<% }%>
<% 
String sql3= "select * from comment where GameID=? ";


PreparedStatement pstmt3=conn.prepareStatement(sql3);
pstmt3.setString(1,GameID);
ResultSet rs3= pstmt3.executeQuery();


while(rs3.next()){
String Commentor=rs3.getString("Commentor");
String Comment=rs3.getString("Comment");
Date Date=rs3.getDate("Date"); 
int Rating=rs3.getInt("Rating");


%>
<br/>
<br/>
<div id="comment">
Commenter: <%=Commentor %>
<br/>
Date Posted: <%=Date %>
<br/>
Rating: <%=Rating %> /5
</br><hr/>
<p id="com"><%=Comment %></p>


</div>
<%} %>
<script type="text/javascript">
$('.myMenu ul li').hover(function() {
	$(this).children('ul').stop(true, false, true).slideToggle(300);
	
});
</script>
	<%conn.close();%>
</body>
</html>