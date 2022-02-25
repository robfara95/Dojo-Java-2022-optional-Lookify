<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Add song</title>
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<a href="/dashboard">dashboard</a>		
		<form:form method="POST" action="/songs/new" class="col-6" modelAttribute="playlist" >
				<div class="form-group form-row form-inline input-group flex-nowrap">
					<form:label path="title" class="col-form-label col-sm-2" >Title</form:label>					
					<form:input type="text" path="title" class="form-control col-sm-10" />	
					<form:errors path="title" class="text-danger error-space" />			
				</div>
				<div class="form-group form-row input-group flex-nowrap">
					<form:label path="artist" class="col-sm-2 col-form-label" >Artist</form:label>					
					<form:input type="text" path="artist" class="form-control col-sm-10" />	
					<form:errors path="artist" class="text-danger error-space" />			
				</div>	
				<div class="form-group form-row input-group flex-nowrap">
					<form:label path="rating" class="col-sm-2 col-form-label" >Rating</form:label>					
					<form:input type="number" path="rating" class="form-control col-sm-5" />	
					<form:errors path="rating" class="text-danger error-space" />			
				</div>				
				<input type="submit" value="Add Songs" class="btn btn-primary">					
		</form:form>
		
		<h3><c:out value="${message}"/></h3>
	
	</div>
</body>
</html>