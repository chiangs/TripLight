<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>

<head>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/userMain.css">
</head>

<body>
	<%@ include file="sidenav.jsp"%>


	<div class="profile-content">
<div class="well">
		<form action='updateUser.do' method="POST">

			<div class="form-group">
				<label for="userId"></label> <input type="hidden"
					class="form-control" value="${userToUpdate.id}" name='id'>
			</div>
			<div class="form-group">
				<label for="firstName">First Name:</label> <input type="text"
					class="form-control" value="${userToUpdate.firstName}" name='firstName' >

			</div>
			<div class="form-group">
				<label for="lastName">Last Name:</label> <input type="text"
					class="form-control" id="usr" value="${userToUpdate.lastName}"name='lastName'>
			</div>
			<div class="form-group">
				<label for="username">Username:</label> <input type="text"
					class="form-control" id="pwd"  value="${userToUpdate.username}"name="username">
			</div>
			
			<div class="form-group">
				<label for="password">Password:</label> <input type="text"
					class="form-control" id="pwd" value="${userToUpdate.password}" name="password">
			</div>
			
			<div class="form-group">
				<label for="country">Current Country:</label> <input type="text"
					class="form-control" id="pwd" value="${userToUpdate.country.name}" name="countryName">
			</div>
			
			<div class="form-group">
				<label for="usr">Email Address:</label> <input type="text"
					class="form-control" id="pwd" value="${userToUpdate.email}" name="email"> 
				<button type="submit" class="btn btn-success btn-md">Submit Changes</button>
			</div>
			
			<input type="hidden"
					class="form-control" id="pwd" value="${userToUpdate.country.name}" name="originalCountry">
		</form>
</div>


	<div class="well">
		
		<form action='deleteUser.do' method="POST">	
			<div class="form-group">
				<label for="userId"></label> <input type="hidden"
					class="form-control" value="${userToUpdate.id}" name='myId'>
					<div class="form-group">
					<h3>Delete my Account</h3>
					<button type="submit" class="btn btn-danger btn-md">Delete. Are you sure?! This is foreeeever!!</button>
					</div>
				</div>				
			</form>
		</div>
	</div>
	




	<!-- /container -->
	<%@ include file="endBody.jsp"%>
</body>
<%@ include file="footer.jsp"%>
</html>