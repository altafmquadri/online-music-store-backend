<%@page import="com.capstone.model.Song"%>
<%@page import="com.capstone.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.capstone.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
       integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
        crossorigin="anonymous"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		Customer c = (Customer) session.getAttribute("customer");
		if (c == null) {
			response.sendRedirect("/login");
		}
	%>
	
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
	<div>
		<h1>Checkout</h1>		
	</div>		
		<div>
			<table class="table table-light table-striped table-bordered table-sm" border='1' style="width: 100%;text-align:center;">
				<tr class="table-dark">
					<th>Image</th>
					<th>Title</th>
					<th>Description</th>
					<th>Artist</th>
					<th>Genre</th>
					<th>Format</th>
					<th colspan="2">Price</th>					
				</tr>

				<%
					@SuppressWarnings("unchecked")
					List<Song> songCart = (List<Song>) session.getAttribute("cart");
				%>
				<%
					for (Song s : songCart) {
				%>
				<tr class="table align-middle" style="text-align: center">
					<td><img style="width: 75px; height: 75px"
						src="<%=s.getImageUrl()%>" alt="song image" /></td>
					<td><%=s.getTitle()%></td>
					<td><%=s.getDescription()%></td>
					<td><%=s.getArtist()%></td>
					<td><%=s.getGenre()%></td>
					<td><%=s.getFormat()%></td>
					<td>$<%=s.getPrice()%></td>
				</tr>
								
				<%
				}
				%>
					<tr class="table-dark" >
						<td style="text-align:right; font-size:20px"  colspan="6">Total:</td>	
						<td style="font-size:20px">$${total}</td>
					</tr>
			</table>
			<div class="clearfix mb-5"> 
				<a class="float-end btn btn-warning" href="/mailing">Place Order</a>
			</div>		
		</div>
		
	</div>
</body>
</html>