<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>

<head>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/userMain.css">
<link rel="stylesheet" href="css/postByCountry.css">
</head>

<body>

	<%@ include file="sidenav.jsp"%>

	<c:choose>
		<c:when test="${not empty postList}">
			<h1 class="title">Your Posts</h1>
			<br />
		</c:when>
		<c:otherwise>
			<h1 class="title">You have no posts!</h1>
			<br />
		</c:otherwise>
	</c:choose>
	
	
	<c:choose>
		<c:when test="${not empty postList}">
			<c:forEach var="post" items="${postList}">
	<div class="well">
				<ul class="postDisplay">
			 	<li><h3 class="wellTitle">${post.place.name} </h3><br>
			 	    <h4>Post created by: ${post.user.firstName} ${post.user.lastName} - ${post.date}</h4> 
			 		<br>
			 		<br>
					<blockquote>"${post.review}"
		</blockquote>
			 	</li> 
				</ul>
				
		<form class="formWithButtons"action='destroyPost.do' method="POST">	
				<label for="postId"></label> <input type="hidden"
					class="form-control" value="${post.id}" name='postId'>
					<button type="submit" class="formWithButtons btn btn-danger btn-md pull-right">I take it back, delete this post.</button>
			</form>
				
		<form class="formWithButtons"action='updatePost.do' method="GET">	
				<label for="postId"></label> <input type="hidden"
					class="form-control" value="${post.id}" name='postId'>
					<button type="submit" class="formWithButtons btn btn-warning btn-md pull-right">Edit Post</button>
			</form>
	</div>		
			</c:forEach>
		</c:when>
	</c:choose>



	<!-- /container -->
	<%@ include file="endBody.jsp"%>
</body>
<%@ include file="footer.jsp"%>
</html>
