<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<head>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/postByCountry.css">
</head>

<body>

	<%@ include file="sidenav.jsp"%>
<div class="main-content">
	<form action='displayPostByCountry.do' method="POST">
		<div class="form-group">
			<label for="country"><h2 class="title">Which Country do you want to see post
				about?</h2></label> <input class="form-control" type="text" class="form-control" id="pwd"
				value="${sessionUser.country.name}" name="countryName"> <button class="btn btn-info"
				type="submit">Find posts!</button>
		</div>
	</form>
	
	<c:choose>
		<c:when test="${not empty postList}">
	<div class="well">
			<c:forEach var="post" items="${postList}">
				<ul class="postDisplay">
			 	<li><h3 class="wellTitle">${post.place.name} </h3><br>
			 	    <h4>Post created by: ${post.user.firstName} ${post.user.lastName} - ${post.date}</h4> 
			 		<br>
			 		<br>
					<blockquote>"${post.review}"</blockquote>
			 	</li> 
				</ul>

			</c:forEach>
</div>
		</c:when>
	</c:choose>
	
	 <c:if test="${empty postList}">
		<h1>No posts for this location yet!</h1>
	</c:if>

</div>

	<!-- /container -->
	<%@ include file="endBody.jsp"%>
</body>
<%@ include file="footer.jsp"%>
</html>
