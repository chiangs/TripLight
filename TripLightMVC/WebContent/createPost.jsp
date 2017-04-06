<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<head>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/main.css">
</head>

<body>

	<%@ include file="sidenav.jsp"%>


	<div class="profile-content">

		<div class="well">

			<h2 class="title">Craft your Review</h2>
			<h4>If this place doesn't exist in our database, you will be sent to a page to set the details of the place after you submit.</h4>
			<br>
				<form:form action="createPost.do" method="POST" modelAttribute="newPost">

					<label>Name of place you are reviewing:</label> <p style="color:red">${noPlaceName}</p><input class="form-control" type="text" name="place" placeholder="Place name"/><br /> 
					<label>Review:</label> <form:errors path="review"></form:errors>
					 <form:textarea class="form-control" rows="10" path="review" placeholder="min. 10 characters, max 250"></form:textarea><br />
					<label>Date Visited:<input class="form-control" type="date" name="dateString" /></label><br /> 
					<input type="submit" class="btn btn-primary" value="Submit Your Review" />
				</form:form>
			</div>
		</div>









	<!-- /container -->
	<%@ include file="endBody.jsp"%>
</body>
<%@ include file="footer.jsp"%>
</html>