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
		
			<h2 class="title">Edit Post</h2>
			<h3>${post.place.name }</h3>
		
			<form action="updatePost.do" method="POST">
				<input type="hidden" name="postId" value="${post.id }" /> 
				<!-- <label for="placeName"></label> <br /> --> 
				<label for="review">Edit Review</label> <textarea class="form-control" rows="15" type="text" name="review" value="${post.review}" >${post.review}</textarea><br />
				<label for="date">Edit Date</label> <input type="date" name="dateStr" value="${post.date }" /><br />
				<input type="submit" class="btn btn-primary" value="Submit Edits" />
			</form>
		</div>

	</div>



	<!-- /container -->
	<%@ include file="endBody.jsp"%>
</body>
<%@ include file="footer.jsp"%>
</html>