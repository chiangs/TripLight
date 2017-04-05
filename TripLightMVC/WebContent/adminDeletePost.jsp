<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<head>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/main.css">
</head>

<body>
<%@ include file="sidenav.jsp"%>

 <div class="profile-content">
                        <h1 class="title">Admin Actions</h1>



			<c:forEach var="post" items="${postList}">
			<div class="well">
				<ul class="postDisplay">
			 	<li><h3>${post.id}: ${post.place.name} </h3><br>
			 	    <h4>Post created by: ${post.user.firstName} ${post.user.lastName} - ${post.date}</h4> 
			 		<br>
			 		<br>
					<blockquote>"${post.review}"</blockquote>
			 	</li> 
				</ul>

		<form class="formWithButtons" action='deletePost.do' method="POST">
			 				<input type ="hidden" value = "${post.id}" name ="deleteId">
                            <button type="submit" class="btn btn-danger btn-sm" align="right">Delete Post</button>
		</form>
		</div>
			</c:forEach>
		

	
</div>
</body>
</html>