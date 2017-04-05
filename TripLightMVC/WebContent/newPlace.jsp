<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>

<head>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/main.css">
</head>

<body>

	<%@ include file="sidenav.jsp"%>


	<div class="well">
		<h3>Create a Place</h3>


		<form action="createPlace.do" method="POST">
			<label>Name<input type="text" name="name" /></label><br /> <label>City<input
				type="text" name="cityName" /></label> <br />
			<label>Country<input type="text" name="countryName" /></label> <br />
			<input type="submit" value="Submit Place" />
		</form>
		<br /> <br />

	</div>



	<!-- /container -->
	<%@ include file="endBody.jsp"%>
</body>
<%@ include file="footer.jsp"%>
</html>