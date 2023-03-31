<?php
	session_start();
?>
<html>
	<head>
		<title>
			View Available Flights
		</title>
		<style>
			input {
    			border: 1.5px solid #030337;
    			border-radius: 4px;
    			padding: 7px 30px;
			}
			input[type=submit] {
				background-color: #030337;
				color: white;
    			border-radius: 4px;
    			padding: 7px 45px;
    			margin: 0px 127px
			}
			input[type=date] {
				border: 1.5px solid #030337;
    			border-radius: 4px;
    			padding: 5.5px 44.5px;
			}
			
			select {
    			border: 1.5px solid #030337;
    			border-radius: 4px;
    			padding: 6.5px 75.5px;
			}
			.ek{
				background-image :url(pic2.jpg);
				background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: center top;
  font-family: 'Anton', sans-serif;
  color: black;
  font-size: 150%;
			}
		</style>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>
		<link rel="stylesheet" href="font-awesome-4.7.0\css\font-awesome.min.css">
	</head>
	<body class="ek">
		<h1 id="title">
		<center>	SKYPLANNER    </center>
		</h1>
		<div>
			<ul>
				<li><a href="customer_homepage.php"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
				<li><a href="customer_homepage.php"><i class="fa fa-desktop" aria-hidden="true"></i> Dashboard</a></li>
				<li><a href="home_page.php"><i class="fa fa-plane" aria-hidden="true"></i> About Us</a></li>
				<li><a href="logout_handler.php"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
				<link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
			</ul>
		</div>
		<form action="view_flights_form_handler.php" method="post">
			<h2><center>SEARCH FOR AVAILABLE FLIGHTS</center></h2>
			<table cellpadding="5"  style="padding-left: 500px; padding-top: 0px;">
				<tr>
					<td class="fix_table">Enter the Origin</td>
					<td class="fix_table">Enter the Destination</td>
				</tr>
				<tr>
					<td class="fix_table">
						<input list="origins" name="origin" placeholder="From" required>
  						<datalist id="origins">
  						  	<option value="Bangalore">
							<option value="Mumbai">
  						  	<option value="Mysore">
  						  	<option value="Mangalore">
  						  	<option value="Chennai">
  						  	<option value="Hyderabad">
							<option value="Delhi">
  						  	<option value="Pune">
  						  	<option value="Goa">
  						  	<option value="Pondicherry">
  						  	<option value="Thiruvanantapuram">
						    <option value="Patna">
  						</datalist>
						 </td>
					<td class="fix_table"  >
						<input list="destinations" name="destination" placeholder="To" required>
  						<datalist id="destinations">
						  <option value="Bangalore">
  						  	<option value="Mumbai">
  						  	<option value="Mysore">
  						  	<option value="Mangalore">
  						  	<option value="Chennai">
  						  	<option value="hyderabad">
							<option value="Delhi">
  						  	<option value="Pune">
  						  	<option value="Goa">
  						  	<option value="Pondicherry">
  						  	<option value="Thiruvanantapuram">
						    <option value="Patna">
							
  						</datalist>
						</td>
				</tr>
			</table>
			<br>
			<table cellpadding="5"  style="padding-left: 500px; padding-top: 0px;">
				<tr>
					<td class="fix_table">Enter the Departure Date</td>
					<td class="fix_table">Enter the No. of Passengers</td>
				</tr>
				<tr>
					<td class="fix_table"><input type="date" name="dep_date" min=
						<?php 
							$todays_date=date('Y-m-d'); 
							echo $todays_date;
						?> 
						max=
						<?php 
							$max_date=date_create(date('Y-m-d'));
							date_add($max_date,date_interval_create_from_date_string("90 days")); 
							echo date_format($max_date,"Y-m-d");
						?> required></td>
					<td class="fix_table"><input type="number" name="no_of_pass" placeholder="Eg. 5" required></td>
				</tr>
			</table>
			<br>
			<table cellpadding="5" style= "padding-left: 650px; padding-top: 0px;">
				<tr>
					<td class="fix_table">Enter the Class</td>
				</tr>
				<tr>
					<td class="fix_table">
						<select name="class">
  							<option value="economy">Economy</option>
  							<option value="business">Business</option>
  						</select>
  					</td>
				</tr>
			</table>
			<br>
			
			<input type="submit"  style= "margin-left: 600px; padding-top: 0px; width: 300px;" value="Search for Available Flights" name="Search">
		</form>
	</body>
</html>