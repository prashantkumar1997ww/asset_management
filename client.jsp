<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="UTF-8" />
	<title>Client Page</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" type="text/css" href="css/client.css">
  </head>
  <body>
	<nav id="navbar">
        <div class="container">
          <ul>
            <li><a href="dashboard.jsp" id="dashlink"><strong>Dashboard</strong></a></li> 
          </ul>
        </div>
	</nav>  

	<div class='flex_box'>
	<div class='flex_img'>
		<img src='./image/laptops.png'>
	</div>
	<div class='flex_text'>
		<form action="" class="box">
			<h3>Number of Laptops</h3>
			<input type="number" name="quantity" placeholder="Qunatity" id="Laptops" required>
			<button type="button" onclick="addComponents('Laptops',2)">Add</button>
		</form>
	</div>
	</div>	  
	
	<div class='flex_box'>
	<div class='flex_img'>
		<img src='./image/monitor.png'>
	</div>
	<div class='flex_text'>
		<form action="" class="box">
			<h3>Number of Monitors</h3>
			<input type="number" name="quantity" placeholder="Qunatity" id="Monitors" required>
			<button type="button" onclick="addComponents('Monitors',3)">Add</button>
		</form>
	</div>
	</div>

	<div class='flex_box'>
	<div class='flex_img'>
		<img src='./image/keyboard.png'>
	</div>
	<div class='flex_text'>
		<form action="" class="box">
			<h3>Number of Keyboards</h3>
			<input type="number" name="quantity" placeholder="Qunatity" id="Keyboards" required>
			<button type="button" onclick="addComponents('Keyboards',4)">Add</button>
		</form>
	</div>
	</div>

	<div class='flex_box'>
	<div class='flex_img'>
		<img src='./image/mouse.png'>
	</div>
	<div class='flex_text'>
		<form action="" class="box">
			<h3>Number of Mouse</h3>
			<input type="number" name="quantity" placeholder="Qunatity" id="Mouse" required>
			<button type="button" onclick="addComponents('Mouse',5)">Add</button>
		</form>
	</div>
	</div>
	<div class='flex_box'>
	<div class='flex_img'>
		<img src='./image/cpu.png'>
	</div>
	<div class='flex_text'>
		<form action="" class="box">
			<h3>Number of CPU</h3>
			<input type="number" name="quantity" placeholder="Qunatity" id="CPU" required>
			<button type="button" onclick="addComponents('CPU',6)">Add</button>
		</form>
	</div>
	</div>
	<div class="toast" id="toast">Successfully Added</div>
	<script>
		function activate()
		{
			var toast = document.getElementById("toast");
			toast.className+=" active_toast";
			setTimeout(() => {
				toast.className="toast";
			}, 3000);
		}
		var res = window.location.href.split("=");
		var user = res[res.length - 1];
		document.getElementById("dashlink").href += "?user="+user; 


		function addComponents(s,col){
		var component_val = document.getElementById(s).value; 
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
			activate();
			}
		};
		var str = 'client_ajax.jsp?component='+ col+'&quantity='+component_val+'&u='+user+'&c='+s;
		
		xmlhttp.open("GET",str, true);
		xmlhttp.send();
		}
	</script>

	</body>
</html>
