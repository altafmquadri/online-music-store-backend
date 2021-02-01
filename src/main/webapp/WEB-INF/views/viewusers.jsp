<%@page import="com.capstone.model.Admin"%>
<%@page import="com.capstone.model.Song"%>
<%@page import="com.capstone.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.capstone.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<%
		Admin a = (Admin) session.getAttribute("admin");
	if (a == null) {
		response.sendRedirect("/login");
	}
	%>


<div class="container">
<div style="height: 10px;"></div>
	<div class="navbar navbar-expand-lg navbar-dark bg-dark">
		
		<div class="container-fluid" >
			<div>
				<nav class="navbar-brand"><h3>Welcome ${admin.getUsername()}</h3></nav>
			</div>

			<div>
				<nav>
					<a class="navbar-brand" href="/admin/songs">Inventory</a>
				</nav>
			</div>
			<div>
				<nav>
					<a class="navbar-brand" href="/admin/logout"><span><i class="fas fa-sign-out-alt fa-2x"></i></span></a>
				</nav>
			</div>
		</div>
	</div>
	<div>
	<div style="height: 20px"></div>
		<h1>Registered Users</h1>
		<div>
			<table class="table table-light table-striped table-bordered table-sm" border='1' style="width: 100%;text-align:center;">
				<tr class="table-dark">
					<th>Username:</th>
					<th>Phone Number:</th>
					<th>Email</th>
					<th>Address</th>					
				</tr>

				<%
					@SuppressWarnings("unchecked")
					List<Customer> users = (List<Customer>) session.getAttribute("users");
				%>
				<%
					for (Customer u : users) {
				%>
				<tr class="table align-middle" style="text-align: center">					
					<td><%=u.getUsername()%></td>
					<td><%=u.getPhoneNumber()%></td>
					<td><%=u.getEmail()%></td>
					<td><%=u.getAddress()%></td>					
				</tr>
				<%
					}
				%>
			</table>			
		</div>

	</div>
	</div>
</body>
</html>