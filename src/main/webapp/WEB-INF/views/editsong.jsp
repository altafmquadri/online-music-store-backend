<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
	
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	 <div style="height: 10px;"></div>
            <div class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid">

                    <div>
                        <nav class="navbar-brand">Welcome ${admin.getUsername()}</nav>
                    </div>
                    <div>
						<nav>
							<a class="navbar-brand" href="/admin/songs">Inventory</a>
						</nav>
					</div>
                    <div>
                        <nav><a class="navbar-brand" href="/admin/viewusers">Customers</a></nav>
                    </div>
                    <div>
						<nav>
							<a class="navbar-brand" href="/admin/logout"><span><i class="fas fa-sign-out-alt fa-2x"></i></span></a>
						</nav>                  		
				  </div>
                </div>
            </div>
      <div style="height: 20px"></div>
            
	<h3>Edit ${song.getTitle()}</h3>
	<div class="input-group mb-3">
		<form class="form-control" method="post">
			<div class="mb-2">
				<label class="form-label">Song Title</label>
				<input  class="form-control"type="text" name="imageUrl" value="${song.getImageUrl()}">
			</div>

			<div class="mb-2">
				<label class="form-label">Song Title</label> 
				<input class="form-control" type="text" name="title" value="${song.getTitle()}">
			</div>
			
			<div class="mb-2">
				<label class="form-label">Song Description</label> 
				<input class="form-control" type="text" name="description" value="${song.getDescription()}">
			</div>
			
			<div class="mb-2">
				<label class="form-label">Artist</label> 
				<input  class="form-control"type="text" name="artist" value="${song.getArtist()}">
			</div>
			
			<div class="mb-2">
				<label class="form-label">Genre</label> 
				<input  class="form-control"type="text" name="genre"
					value="${song.getGenre()}">
			</div>
			
			<div class="mb-2">
				<label class="form-label">Format</label> 
				<select class="form-select" name="format" >
						<option value="${song.getFormat()}">${song.getFormat()}</option>
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
				<input class="form-control" type="text" name="price" value="${song.getPrice()}">
			</div>
			
			<div class="clearfix mb-2">
				<button style="margin-left:10px;" class="btn btn-warning float-end">Cancel</button>
				
				<input  class="btn btn-success float-end" type='submit' value="Save">
			</div>
			
			
		</form>
	</div>
</div>
</body>
</html>