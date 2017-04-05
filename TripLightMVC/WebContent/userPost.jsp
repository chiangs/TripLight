<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<head>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/userMain.css">
<link rel="stylesheet" href="css/postByCountry.css">
</head>

<body>

	<%@ include file="sidenav.jsp"%>

	<h1>Your Posts</h1>
	
	<div class="well">
	<c:choose>
		<c:when test="${not empty postList}">
			<c:forEach var="post" items="${postList}">
				<ul class="postDisplay">
			 	<li><h3>${post.id}: ${post.place.name} </h3><br>
			 	    <h4>Post created by: ${post.user.firstName} ${post.user.lastName} - ${post.date}</h4> 
			 		<br>
			 		<br>
					<blockquote>"${post.review}"</blockquote>
			 	</li> 
				</ul>

			</c:forEach>
		</c:when>
	</c:choose>
</div>



	<!-- /container -->
	<%@ include file="endBody.jsp"%>
</body>
<%@ include file="footer.jsp"%>
</html>
