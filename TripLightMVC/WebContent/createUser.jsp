<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<head>
   <%@ include file="header.jsp"%>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/create.css">
</head>

<body>
<c:choose>
<c:when test="sessionUser != null">
	<h1>USER!!!</h1>
</c:when>

</c:choose>

    <div class="container">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-heading">
                    <h2 class="text-center">Welcome, Amigo!</h2>
                </div>
                <hr />
                <div class="modal-body">
                    <form:form action="createUser.do" method="POST" role="form" modelAttribute="sessionUser" >
					
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
            <span class="glyphicon glyphicon-user"></span>
                                </span>
                                <form:input type="text" class="form-control" path="firstName" placeholder="First Name" />
                            </div>
                                <p class="errors"><form:errors path="firstName"></form:errors></p>
                        </div>
                           
                       <div class="form-group">
                           <div class="input-group">
                                <span class="input-group-addon">
            <span class="glyphicon glyphicon-user"></span>
                                </span>
                                <form:input type="text" class="form-control" placeholder="Last Name" path="lastName" />
                            </div>
                                <p class="errors"><form:errors path="lastName"></form:errors></p>
                       </div>
                            

                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
            <span class="glyphicon glyphicon-user"></span>
                                </span>
                                <form:input type="text" class="form-control" placeholder="User Name" path="username" />
                            </div>
                                <p class="errors"><form:errors path="username"></form:errors></p>
                        </div>

                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
            <span class="glyphicon glyphicon-lock"></span>
                                </span>
                                <form:input type="password" class="form-control" placeholder="Password" path="password" />
                            </div>
                                <p class="errors"><form:errors path="password"></form:errors></p>
                        </div>


                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
            <span class="glyphicon glyphicon-envelope"></span>
                                </span>
                                <form:input type="email" class="form-control" placeholder="Email" path="email"/>
                            </div>
                                <p class="errors"><form:errors path="email"></form:errors></p>
                        </div>

                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-success btn-lg">Submit</button>
                            <a href="login.do" class="btn btn-primary btn-lg" role="button">Back to Landing Page</a>
                        </div>                        
                    </form:form>
                </div>
            </div>
        </div>
    </div>



    <!-- /container -->
 <%@ include file="endBody.jsp"%>
</body>
<%@ include file="footer.jsp"%>
</html>