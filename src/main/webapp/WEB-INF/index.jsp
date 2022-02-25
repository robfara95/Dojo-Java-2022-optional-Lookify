<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Lookify</title>
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div id="hdg-selected">
			<a href="/songs/new">add new</a>
			<form action="/search" method="POST">				
				<input type="text" name="artist">
				<button class="btn-primary">Search Artist</button>
			</form>			
			<a href="/search/topTen">Top Songs</a>
		</div>
	
		<table class="table">
	    	<thead>
	        	<tr>
	          	  <th>Name</th>
	          	  <th>Rating</th>
	          	  <th>actions</th>
	          	  <th> </th>
	        </tr>

	   	 	</thead>
	    	<tbody>
	       		<c:forEach var="playList" items="${playLists}">	       			
					<tr>						
						<td><a href="/songs/<c:out value="${playList.id}"/>"><c:out value="${playList.title}"/></a></td>						   
						<td><c:out value="${playList.rating}"/></td>	
						<td>
							<form action="/songs/${playList.id}" method="post">
								<input type="hidden" name="_method" value="delete">
								<input type="submit" value="delete" class="btn btn-danger">
							</form>
							
						</td>	
					</tr>
				</c:forEach>
	    	</tbody>
		</table>
		
		<h3><c:out value="${message}"/></h3>
	
	</div>
</body>
</html>