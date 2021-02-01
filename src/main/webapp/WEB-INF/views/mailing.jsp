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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div style="height: 10px;"></div>
	<div class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid" >
		<div >
			<nav class="navbar-brand"> Hello, ${customer.getUsername()}</nav>
		</div>
		<div>
			<nav><a class="navbar-brand" href="/songs"><i style="color:white" class="fas fa-home fa-2x"></i> </a></nav>
		</div>
		<div>
			<nav><a class="navbar-brand" href="/cart"><i style="color:white" class="fas fa-shopping-cart fa-2x"></i></a><span style="margin: -35px;margin-top:-50px" class="badge bg-danger">${cart.size()}</span></nav>
		</div>		
		<div>
			<nav><a class="navbar-brand" href="/pastorders"><span><i class="fas fa-file-invoice fa-2x"></i></span></a></nav>
		</div>		
		<div>
			<nav><a class="navbar-brand" href="/logout"><span><i class="fas fa-sign-out-alt fa-2x"></i></span></a></nav>
		</div>
	</div>
	</div>
	<div style="height: 20px"></div>
		<h1> Add Mailing Address</h1>
		<form method="post"  class="form-control">
			<div class="mb-2" >
				<label class="form-label">Street:</label> 
				<input class="form-control" type="text" name="street" required="required">
			</div>

			<div>
				<label class="form-label">City:</label> 
				<input class="form-control" type="text" name="city" required="required" >
			</div>
			
			<div>
				<label class="form-label">State</label> 
				<input class="form-control" type="text" name="state" required="required">
			</div>
			
			<div class="mb-2">
				<label class="form-label">Zip:</label> 
				<input class="form-control" type="text" name="zip" required="required">
			</div>			
			
			<div class="mb-2">
				<input class="btn btn-success" type="submit" value="Save">
			</div>
			
		</form>
		
</div>
</body>
</html>