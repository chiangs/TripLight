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
</head>

<body>
<%@ include file="sidenav.jsp"%>

	<c:forEach var="user" items="${allUsers}">
		<ul>
			<li>User ID: ${user.id}, User First Name:${user.firstName}, User
				Last Name: ${user.lastName}, User Username:${user.username}</li>
		</ul>
		<form action='deleteUsers.do' method="POST">
			<div class="form-group">
				<input type ="hidden" value = "${user.id}" name ="id">
				<label for="usr">Delete Account:</label> 
				<input type="submit" value="Submit">
			</div>
		</form>
	</c:forEach>
	
	  <!-- /container -->
  	<%@ include file="endBody.jsp"%>
</body>
<%@ include file="footer.jsp"%>
</html>
	