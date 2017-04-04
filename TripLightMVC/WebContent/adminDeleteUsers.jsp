<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>

<head>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/userMain.css">
</head>

<body>
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

</body>
</html>