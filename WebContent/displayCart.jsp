<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SP Game Store</title>
	<link rel="stylesheet" type="text/css" media="screen" href="styles.css" />
	<%@ page import="java.sql.*" %>
	<script type="text/javascript" src="jquery.js"></script>
	<script src="jquery.blueberry.js"></script>

</head>
<body>
<%@include file="validate.jsp"%>
<%		

       ArrayList<Cart> cart  = (ArrayList<Cart>)session.getAttribute("display");

      if(cart ==null){
    	  %>
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
	<%}%>
    	<%
    	String GameID=request.getParameter("hiddenID");
    	String []genre=MemberUtility.getGenre();
    	int i=0;


    	%>
    	<div class="menuBackground">
    		<div class="center myMenu">
    			<ul class="dropDownMenu">
    	  <li><a href="index.jsp">Home</a></li>
    	  <li><a href="allGames.jsp">Games</a></li>
    	  <li><a href="#">Genre</a>
    	     <ul>
				<%	while(i<genre.length){%>
				<li><a href="showDetailGenre.jsp?hiddenID=<%=genre[i] %>"><%= genre[i]%></a></li>
				<%i++; %>
				<% } %>

   			 </ul>
    	  </li>
    	  <li><a href="searchForm.jsp">Search</a></li>
    	  

    	</ul>
    	</div>
    	</div>
    	</p>
    	<div id="cartTable">
    	<table border ='0' style="width:95%">
    		
    		<tr><p id="gamefont">Shopping Cart <hr style="height:1px;border-width:0;color:gray;background-color:white"></tr>
    	   
    	    
    	    <p id="gamefont">You have no items in cart<p/>
            <a href="allGames.jsp"><input type="submit" name="btnAdd" value="Add games"/></a>
            
    	</table>
    	  
    	  
    	  
    	  <%	  
      } else {
      
%>
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
	<%}%>

<%
String GameID=request.getParameter("hiddenID");
String []genre=MemberUtility.getGenre();
int i=0;


%>
<div class="menuBackground">
	<div class="center myMenu">
		<ul class="dropDownMenu">
  <li><a href="index.jsp">Home</a></li>
  <li><a href="allGames.jsp">Games</a></li>
  <li><a href="#">Genre</a>
     <ul>
	<%	while(i<genre.length){%>
	<li><a href="showDetailGenre.jsp?hiddenID=<%=genre[i] %>"><%= genre[i]%></a></li>
	<%i++; %>
	<% } %>

    </ul>
  </li>
  <li><a href="searchForm.jsp">Search</a></li>
  

</ul>
</div>
</div>
</p>
<div id="cartTable">
<table border ='0' style="width:95%">
	
	<tr><p id="gamefont">Shopping Cart <hr style="height:1px;border-width:0;color:gray;background-color:white"></tr>
    <th style="text-align:left;width:38%">Game</th>
    <th style="text-align:left;width:20%">Price</th>
    <th style="text-align:left;width:21%">Quantity</th>
    <% 
    double itemprice = 0;
    double sum = 0;
    for(Cart c : cart){
    	itemprice = c.getPrice() * c.getQuantity();
    	sum+= c.getPrice() * c.getQuantity();
    	%>
    	
    <tr>
    <td style="text-align:left">
    <%=c.getGameTitle() %>
    </td>
    <td style="text-align:left">
    <%="$"+itemprice%>
    <input type="hidden" value="<%=c.getPrice()%>" name="price">
    </td>
    
    <td>
    <form action="updateServlet" name="fa" id="fa" >
    <input type="hidden" value="<%=c.getGameTitle()%>" name="title">
    <input type="text" value="<%=c.getQuantity() %>" name="quantity" id="quantity" style="width:38%;float:left">
    </td>
    <td>
    <input type="submit" value="Update" name="update" id="update" style="float:left" >
    </form>
    </td>
    
    <td>
    <form action="RemoveItemServlet">
    <input type="hidden" value="<%=c.getGameTitle()%>" name="gametitle">
    <input type="submit" value="Remove">
    
    
    </form>
    </td>
    </tr>
    
 
<% 
}//for 
%>

</table>
 <hr style="height:1px;border-width:0;color:gray;background-color:white"></tr>
    <table border ='0' style="width:95%">
    <td style="text-align:left;font-size:22px;width:34.7%">SubTotal:</td>
    <td style="text-align:left;font-size:22px;width:58%">
    $<%=sum%>
    </td>
    </table>
<br/>

<a href="checkout.jsp">
<input type="submit" value="Confirm">
</a>
<a href="allGames.jsp"><input type="submit" name="btnAdd" value="Add more games"/></a>
</div>

<%
      }//else
	%>
	<script type="text/javascript">
$('.myMenu ul li').hover(function() {
	$(this).children('ul').stop(true, false, true).slideToggle(300);
	
});
	</script>
</body>
</html>