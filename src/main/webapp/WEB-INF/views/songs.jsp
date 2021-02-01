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



<title>Song Page</title>
</head>
<body>
<div class="container">
	<%
		Customer c = (Customer) session.getAttribute("customer");
		if (c == null) {
			response.sendRedirect("/login");
		}
	%>
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
		<h1>Songs</h1>
		<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
    <ol class="carousel-indicators">
        <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"></li>
        <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"></li>
        <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img style="width: 100%; height: 55vh;" src="https://dotandline.net/wp-content/uploads/2018/04/1_58uZVuKlz4bhBJF1BL9qdA-1210x642.jpeg"
            class="d-block w-100" alt="chicken">
            <div style="background-color: rgba(0,0,0,.3);"class="carousel-caption d-none d-md-block">
                <h5>Blue</h5>
                <p>The Song that brought the famous anime to an end!</p>
            </div>
        </div>
        <div class="carousel-item">
            <img style="width: 100%; height: 55vh;"
            src="https://s3.amazonaws.com/images.imvdb.com/video/170091730161-danny-ocean-dembow_music_video_ov.jpg?v=2"
            class="d-block w-100" alt="sweet chiilli chicken">
            <div style="background-color: rgba(0,0,0,.3);"class="carousel-caption d-none d-md-block">
                <h5>Dembow</h5>
                <p>Danny Does it Again!</p>
            </div>
        </div>
        <div class="carousel-item">
            <img style="width: 100%; height: 55vh;"
            src="https://sss.moda.pe/imagen/apaisado/a-ella-09c77.jpg"
            class="d-block w-100" alt="lo mein">
            <div style="background-color: rgba(0,0,0,.3);"class="carousel-caption d-none d-md-block">
                <h5>A Ella</h5>
                <p>Karol G delivers!</p>
            </div>
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </a>
</div>

<div style="height: 20px;"></div>
		<div class="mb-3">
			<form >
				<div>
				 
					<label>Filter:</label> 
					
					<span class="input-group-addon">
                             <i class="glyphicon glyphicon-user"></i>
                        </span>
					<input type="text" name="keyword">
					
					<input class="btn btn-primary" type="submit" name="Search" value="Search">
					<a class="btn btn-warning" href="/songs">Clear</a>
				</div>
			</form>
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
					<th>Price</th>
					<th colspan="2">Purchase</th>
				</tr>

				<%
					@SuppressWarnings("unchecked")
					List<Song> songs = (List<Song>) session.getAttribute("songs");
				%>
				<%
					for (Song s : songs) {
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
					<td><a class="btn btn-info" href="/addtocart/<%=s.getId()%>">Add To Cart</a></td>
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