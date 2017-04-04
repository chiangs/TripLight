<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<head>
<%@ include file="header.jsp"%>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/userMain.css">
</head>

<body>

<%@ include file="sidenav.jsp"%>



	<form action='displayPostByCountry.do' method="POST">
			<div class="form-group">
				<label for="country">Which Country do you want to see post about?</label> <input type="text"
					class="form-control" id="pwd" value="${sessionUser.country.name}" name="countryCode">
						<input type="submit" value="Submit">
			</div>
			</form>
   <!--  
                    <div class="profile-content">

                        <div class="well">
                        Content goes here, repeats
                        </div>
 
                    </div>
 -->



    <!-- /container -->
  	<%@ include file="endBody.jsp"%>
</body>
<%@ include file="footer.jsp"%>
</html>
