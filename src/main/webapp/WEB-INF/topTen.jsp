<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Search</title>
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div id="hdg-selected">
			<p>Top Ten Songs</p>
			<a href="/dashboard">Dashboard</a>
		</div>
		
		<div>
			<ol>
				<c:forEach var="playList" items="${topTenSongs}">
				<li><c:out value="${playList.rating}"/> -
				    <c:out value="${playList.title}"/> - 
				    <c:out value="${playList.artist}"/>
				 </li>
				</c:forEach>
			</ol>
		</div>
				
	</div>
</body>
</html>