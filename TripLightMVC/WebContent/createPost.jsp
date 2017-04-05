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
		
			<h3> Create a Post</h3>
			<form action="createPost.do" method="POST">

			
				<label>Place<input type="text" name="place"/></label><br/> 
				
				<label>Review<input	type="text" name="review"/></label> <br/>
				
				<label>Today's Date <input type="date" name="dateString"/></label><br/>
				
				<input type="submit" value="Submit Post"/>
			</form>






		</div>

	</div>



	<!-- /container -->
	<%@ include file="endBody.jsp"%>
</body>
<%@ include file="footer.jsp"%>
</html>