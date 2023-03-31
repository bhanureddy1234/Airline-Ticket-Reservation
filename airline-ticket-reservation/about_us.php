<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}
ul {
  list-style-type: circle;
 margin-right: 1450px;
  padding: 0px;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding-top: 100px;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: #4CAF50;
}


.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
}

.about-section {
  padding: 50px;
  text-align: center;
  background-color: #3295a8;
  color: white;
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: black;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}
.me{
				background-image:url('pic2.jpg');
				background-position:10% 5%;
			}
			

.button:hover {
  background-color: #3295a8;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}




</style>
</head>
<body class="me">

<div class="about-section">
  <h1>About Us Page</h1>
  <p>For any further queries or suggest please feel free to contact us!!</p>
  
</div>
<ul>
  <li><a href="home_page.php">Home</a></li>
  
</ul>




</body>
</html>
