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


</body>
</html>

