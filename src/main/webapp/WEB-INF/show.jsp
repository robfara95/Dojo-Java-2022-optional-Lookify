<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Details</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div id="main">
			<table class="table">
				<thead>
					<tr>
						<th></th>
						<th></th>
						<th><a href="/dashboard">Dashboard</a></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Title</td> 
						<td><c:out value="${playlist.title}"/></td> 
					</tr>
					<tr>
						<td>Artist</td> 
						<td><c:out value="${playlist.artist}"/></td> 
					</tr>
					<tr>
						<td>Rating (1-10)</td> 
						<td><c:out value="${playlist.rating}"/></td> 
					</tr>	
				<tbody> 
			
			</table>
			
			<div>			
				<form action="/songs/${playlist.id}" method="post">
					<input type="hidden" name="_method" value="delete">
					<input type="submit" value="delete" class="btn btn-danger">
				</form>
			</div>
		</div>
	</div>	
</body>
</html>