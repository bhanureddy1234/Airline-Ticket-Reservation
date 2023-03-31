<?php
	session_start();
?>
<html>
	<head>
		<title>
			Welcome Administrator
		</title>
		<style>
		.ek{
			background-image: url('pic1.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: bottom right;
  font-family: 'Anton', sans-serif;
  color: white;
  }

			</style>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>
		<link rel="stylesheet" href="font-awesome-4.7.0\css\font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
	</head>
	<body class="ek">
		<h1 id="title">
		<center>	SKYPLANNER  </center>
		</h1>
		<div>
			<ul>
				<li><a href="admin_homepage.php"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
				<li><a href="admin_homepage.php"><i class="fa fa-desktop" aria-hidden="true"></i> Dashboard</a></li>
				<li><a href="about_us.php"><i class="fa fa-plane" aria-hidden="true"></i> About Us</a></li>
				<li><a href="logout_handler.php"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
			</ul>
		</div>
		<h2>Welcome Administrator!</h2>
		<table>	
			<tr>
				<td id="hi" class="admin_func"><a href="admin_view_booked_tickets.php"><i class="fa fa-plane" aria-hidden="true"></i> View List of Booked Tickets for a Flight</a>
				</td>
			</tr>
			<tr>
				<td id="hi" class="admin_func"><a href="add_flight_details.php"><i class="fa fa-plane" aria-hidden="true"></i> Add Flight Schedule Details</a>
				</td>
			</tr>
			<tr>
				<td id="hi" class="admin_func"><a href="delete_flight_details.php"><i class="fa fa-plane" aria-hidden="true"></i> Delete Flight Schedule Details</a>
				</td>
			</tr>
			<tr> 
				 <td id="hi" class="admin_func"><a href="add_jet_details.php"><i class="fa fa-plane" aria-hidden="true"></i> Add Jet Details</a>
				</td>
			</tr>
			<tr>
				<td  id="hi" class="admin_func"><a href="activate_jet_details.php"><i class="fa fa-plane" aria-hidden="true"></i> Activate Jet</a>
				</td>
			</tr>
			<tr>
				<td id="hi" class="admin_func"><a href="deactivate_jet_details.php"><i class="fa fa-plane" aria-hidden="true"></i> Deactivate Jet</a>
				</td>
			</tr>
		</table>
	</body>
</html>