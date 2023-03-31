<?php
	session_start();
?>
<html>
	<head>
		<title>
			View Available Flights
		</title>
		<style>
		.ek{
				background-image :url(pic2.jpg);
				background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: 20% 35%;
  font-family: 'Anton', sans-serif;
  color: black;
  font-size: 20px;
			}
			</style>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>
		<link rel="stylesheet" href="font-awesome-4.7.0\css\font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
	</head>
	<body class ="ek">
		<h1 id="title">
		<center>	SKYPLANNER   </center>
		</h1>
		<div>
			<ul>
				<li><a href="admin_homepage.php"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
				<li><a href="admin_homepage.php"><i class="fa fa-desktop" aria-hidden="true"></i> Dashboard</a></li>
				<li><a href="home_page.php"><i class="fa fa-plane" aria-hidden="true"></i> About Us</a></li>
				<li><a href="logout_handler.php"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
			</ul>
		</div>
		<h3>Oops! You need to login with a Customer Account to Book Tickets</h3>
	</body>
</html>