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
			<h3>Create a Place</h3>
			
			
			<form action="createPlace.do">
				<label>Name<input type="text" name="name"/></label><br/> <label>City<input
					type="text" name="city"/></label> <br/><label>Country<input type="text" name="countryName"/></label>
					<br/><input type="submit" value="Submit Place"/>
			</form>
			<br/>
			<br/>
			<h3> Or Create Post on Existing Place</h3>
			<form>
				<label>Place<input type="text" /></label><br/> <label>Review<input
					type="text" /></label> <br/><label>Today's Date<input type="date" /></label>
					<br/><input type="submit" value="Submit Post"/>
			</form>




			</form>


		</div>

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