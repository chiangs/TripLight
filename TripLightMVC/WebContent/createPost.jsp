<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
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
			<div class="form-group">
				<form action="createPost.do" method="POST">

					<label>Name of Place you are reviewing:</label><input class="form-control" type="text" name="place" /><br /> 
					<label>Review (min. 10 characters, max 250)</label> <textarea class="form-control" rows="10" name="review" ></textarea><br /> 
					<label>Date Visited:<input class="form-control" type="date" name="dateString" /></label><br /> 
					<input type="submit" class="btn btn-primary" value="Submit Your Review" />
				</form>
			</div>





		</div>

	</div>



	<!-- /container -->
	<%@ include file="endBody.jsp"%>
</body>
<%@ include file="footer.jsp"%>
</html>