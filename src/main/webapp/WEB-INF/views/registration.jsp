<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
       integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
        crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
	<div class="container">
	
	<div style="height: 10px;"></div>
	
	<div class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<nav>
				<a class="navbar-brand" href="/login">Login</a>
			</nav>
		</div>
	</div>
	
	<div style="height: 20px"></div>
	
		<h1>Customer Registration</h1>
		<div class="input-group mb-3">
		<form class="form-control" method="post" >
			<div class="mb-2">
				<label class="form-label">Username:</label> 
				<input class="form-control" type="text" name="name" required="required">
			</div>

			<div class="mb-2">
				<label class="form-label">Password:</label> 
				<input class="form-control" type="password" name="password" required="required" >
			</div>
			
			<div class="mb-2">
				<label class="form-label">Confirm Password:</label> 
				<input class="form-control" type="password" name="confirm" required="required">
			</div>
			
			<div class="mb-2">
				<label class="form-label">Phone Number:</label> 
				<input class="form-control" type="text" name="phoneNumber" required="required">
			</div>
			
			<div class="mb-2">
				<label class="form-label">Email ID:</label> 
				<input class="form-control" type="email" name="email" required="required">
			</div>
			
			<div class="mb-2">
				<label class="form-label">Address:</label> 
				<input class="form-control" type="text" name="address" required="required">
			</div>
			
			<div >
				<input class=" btn btn-primary" type="submit" value="Register">
			</div>
			
		</form>
		</div>
		<div class="form-text" style="color: red;">
			<h3>${message}</h3>
		</div>
	</div>

</body>
</html>