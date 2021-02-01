<%@page import="com.capstone.model.Order"%>
<%@page import="com.capstone.model.Item"%>
<%@page import="com.capstone.model.Customer"%>
<%@page import="com.capstone.model.Song"%>
<%@page import="java.util.List"%>
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

<title>Order Confirmation</title>
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
			<table class="table table-light table-striped table-bordered table-sm" border='1' style="width: 100%;text-align:center;">
				<tr class="table-warning">
					<th colspan="6">Order Number:${orderid}</th>					
				</tr>
				<tr class="table-dark">
					<th>Title</th>
					<th>Description</th>
					<th>Artist</th>
					<th>Genre</th>
					<th>Format</th>
					<th>Price</th>					
				</tr>		
		<%
			Order order = (Order)session.getAttribute("order");
			List<Item> items = (List<Item>) order.getItems();				
		%>
		<%
			for (Item i : items) {
		%>			
				<tr style="text-align: center">					
					<td><%=i.getTitle()%></td>
					<td><%=i.getDescription()%></td>
					<td><%=i.getArtist()%></td>
					<td><%=i.getGenre()%></td>
					<td><%=i.getFormat()%></td>
					<td><%=i.getPrice()%></td>						
				</tr>
				<%
				}
				%>
				<tr class="mb-3">
					<td style="text-align:right;"  colspan="5">Total:</td>	
					<td >$${total}</td>
				</tr>
				
				<tr class="table-dark mb-3">
					<th  colspan="6">Mailing Address:</th>									
				</tr>	
				<tr>
					<th colspan="3">Street</th>
					<th colspan="1.5">City</th>
					<th colspan="1.5">State</th>
					<th colspan="1.5">Zipcode</th>
				</tr>	
				<tr style="text-align: center">
					<td colspan="3">${address.getStreet()}</td>
					<td colspan="1.5">${address.getCity()}</td>
					<td colspan="1.5">${address.getState()}</td>
					<td colspan="1.5">${address.getZip()}</td>				
				</tr>
			</table>
			<div class="clearfix mb-5">
				<a class="float-end btn btn-warning" href="/songs">Continue Shopping</a> 
			</div>
		</div>
	</div>

</body>
</html>