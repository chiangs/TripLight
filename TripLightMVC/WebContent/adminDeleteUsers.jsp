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

                        <div class="well">
	<c:forEach var="user" items="${allUsers}">
		<hr>
		<h4>User ID: ${user.id}<br>
		Username: ${user.username}<br>
		Name: ${user.firstName} ${user.lastName}</h4>
		
		<form class="formWithButtons" action='adminUpdateUser.do' method="POST">
			 				<input type = "hidden" value = "${user.id}" name = "updateid">
			 				<input type = "hidden" value = "${user.country.name}" name = "originalCountry">
			 				<input type = "hidden" value = "${user.country.name}" name = "countryName">
                            <button type = "submit" class = "btn btn-warning btn-sm">Update User</button>
		</form>
		<form class="formWithButtons" action='deleteUsers.do' method="POST">
			 				<input type ="hidden" value = "${user.id}" name ="deleteId">
                            <button type="submit" class="btn btn-danger btn-sm">Delete User</button>
		</form>
	</c:forEach>
	
	   </div>
 
                    </div>
	
	  <!-- /container -->
  	<%@ include file="endBody.jsp"%>
</body>
<%@ include file="footer.jsp"%>
</html>
	