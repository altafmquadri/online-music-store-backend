<%@page import="com.capstone.model.Song" %>
<%@page import="java.util.List" %>
<%@page import="com.capstone.model.Admin" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Admin Song Page</title>
</head>

<body>
    <% 
    	Admin admin=(Admin) session.getAttribute("admin"); if (admin==null) {
        response.sendRedirect("/admin/login"); } 
     %>
        <div class="container">
            <div style="height: 10px;"></div>
            <div class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid">

                    <div>
                        <nav class="navbar-brand">Welcome ${admin.getUsername()}</nav>
                    </div>
                    <div>
                        <nav><a class="navbar-brand" href="/admin/viewusers">All Customers</a></nav>
                    </div>
                    <div>
                        <nav><a class="navbar-brand" href="/admin/logout">Logout</a></nav>
                    </div>
                </div>
            </div>
            <div style="height: 20px"></div>
            <div>
                <h1>Songs</h1>
                
                 <p>
	                <a class="btn btn-info" data-bs-toggle="collapse" href="#collapseOnClick" aria-expanded="false"
	                    aria-controls="collapseOnClick">
	                    Show Form
	                </a>
           		 </p>
                
                <div style="height: 20px"></div>
                <div class="collapse" id="collapseOnClick" class="input-group mb-3">
                
                    <form class="form-control" method="post">
                     	<div class="clearfix" >
                            <input class="btn btn-primary float-end" type='submit' value="Add Song">
                        </div>
                        <div style="height: 5px;"></div>
                        <div class="mb-2">
                            <label class="form-label">Song Image</label>
                            <input class="form-control" type="text" name="imageUrl" required="required">
                        </div>
                        <div class="mb-2">
                            <label class="form-label">Song Title</label>
                            <input class="form-control" type="text" name="title" required="required">
                        </div>
                        <div class="mb-2">
                            <label class="form-label">Song Description</label>
                            <input class="form-control" type="text" name="description"
                                required="required">
                        </div>
                        <div class="mb-2">
                            <label class="form-label">Artist</label>
                            <input class="form-control" type="text" name="artist" required="required">
                        </div>
                        <div class="mb-2">
                            <label class="form-label">Genre</label>
                            <input class="form-control" type="text" name="genre" required="required">
                        </div>
                        <div class="mb-2">
                            <label class="form-label">Format</label>
                            <select class="form-select" required="required" name="format">
                                <option value="AIFF">AIFF</option>
                                <option value="MP3">MP3</option>
                                <option value="MP4">MP4</option>
                                <option value="OGG">OGG</option>
                                <option value="WAV">WAV</option>
                                <option value="WMA">WMA</option>
                            </select>
                        </div>
                        <div class="mb-2">
                            <label class="form-label">Price</label>
                            <input class="form-control" type="text" pattern=^[0-9]{1,10}(\.[0-9]{1,2})?$
                                title="Number upto 10 digits and 2 decimal places" name="price"
                                required="required">
                        </div>
                       
                    </form>
                </div>
                
                <div style="height:25px "></div>


		<div>
			<table  class="table table-light table-striped table-bordered table-sm" border='1' style="width: 100%; text-align:center;">
				<tr class="table-dark">
					<th>Image</th>
					<th>Title</th>
					<th>Description</th>
					<th>Artist</th>
					<th>Genre</th>
					<th>Format</th>
					<th>Price</th>
					<th colspan="2">Update</th>
				</tr>
				<%
					@SuppressWarnings("unchecked")
					List<Song> songs = (List<Song>) session.getAttribute("songs");
				%>
				<%
					for (Song s : songs) {
				%>
				<tr class="table align-middle" style="text-align: center">
					<td> <img style="width: 75px; height:75px" src="<%=s.getImageUrl()%>" alt="song image"/></td>
					<td><%=s.getTitle()%></td>
					<td><%=s.getDescription()%></td>
					<td><%=s.getArtist()%></td>
					<td><%=s.getGenre()%></td>
					<td><%=s.getFormat()%></td>
					<td><%=s.getPrice()%></td>
					<td><a class="btn btn-warning" href="/admin/songs/editsong/<%=s.getId()%>">Edit</a></td>
					<td><a class="btn btn-danger" href="/admin/songs/deletesong/<%=s.getId()%>">Delete</a></td>
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