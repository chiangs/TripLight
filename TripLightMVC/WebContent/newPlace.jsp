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
		<h2 class="title">Create a Place</h2>
		<h4>Please enter the location details of your review!</h4>
		<br>
		<div class="form-group">
		<form action="createPlace.do" method="POST">
			<label>Name</label><input class="form-control" type="text" name="name" value="${placeName}" /><br /> 
			<label>City</label><input class="form-control" type="text" name="cityName" /><br />
			<label>Country</label><input class="form-control" type="text" name="countryName" /><br />
			<label for="review"></label> 
			<input type="hidden" value="${review}" name="review">
			<label for="date"></label> 
			<input type="hidden" value="${date}" name="dateStr">	
					
			<input type="submit" class="btn btn-primary" value="Submit" />
		</form>
		<br /> <br />
</div>
	</div>



	<!-- /container -->
	<%@ include file="endBody.jsp"%>
</body>
<%@ include file="footer.jsp"%>
</html>