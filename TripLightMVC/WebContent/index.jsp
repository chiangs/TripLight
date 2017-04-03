<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>

<head>
<%@ include file="header.jsp"%>

<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/landing.css">

</head>

<body>
	<div class="container-fluid">

		<h1 class="title">Trip Light</h1>

		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-heading">
					<h2 class="text-center">Login</h2>
				</div>
				<hr />
				<div class="modal-body">
					<form:form id="loginForm" action="login.do" method="POST"
						modelAttribute="sessionUser">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"> <span
									class="glyphicon glyphicon-user"></span>
								</span> 
								<form:input id="username" path="username" class="form-control" placeholder="User Name"/>
							  	<form:errors path="username" />
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"> <span
									class="glyphicon glyphicon-lock"></span>
								</span> 
								<form:input id="password" path="password" type="password" class="form-control" placeholder="Password"/>
							  	<form:errors path="password" />
							</div>
							

						</div>

						<div class="form-group text-center">
							<button type="submit" class="btn btn-success btn-lg">Login</button>
							<a href="createUser.html" class="btn btn-link">Join the
								conversation - Create an account</a>
						</div>

					</form:form>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="endBody.jsp"%>
</body>
<%@ include file="footer.jsp"%>
</html>
