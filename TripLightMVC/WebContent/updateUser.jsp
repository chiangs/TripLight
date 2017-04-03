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

		<form action='updateUser.do' method="POST">

			<div class="form-group">
				<label for="usr">ID: ${sessionUser.id}</label> <input type="hidden"
					class="form-control" id="usr" value="${sessionUser.id}" name='id'>
			</div>
			<div class="form-group">
				<label for="usr">First Name:</label> <input type="text"
					class="form-control" id="pwd" name='firstName'>

			</div>
			<div class="form-group">
				<label for="usr">Last Name:</label> <input type="text"
					class="form-control" id="usr" name='lastName'>
			</div>
			<div class="form-group">
				<label for="usr">Username:</label> <input type="text"
					class="form-control" id="pwd" name="username">
			</div>
			<div class="form-group">
				<label for="usr">Password:</label> <input type="text"
					class="form-control" id="pwd" name="password">
			</div>
			<div class="form-group">
				<label for="usr">Email Address:</label> <input type="text"
					class="form-control" id="pwd" name="email"> <input
					type="submit" value="Submit">
			</div>


		</form>
		<div class="well"></div>

	</div>
	</div>
	</div>
	</div>
	</div>



	<!-- /container -->
	<%@ include file="endBody.jsp"%>
</body>
<%@ include file="footer.jsp"%>
</html>