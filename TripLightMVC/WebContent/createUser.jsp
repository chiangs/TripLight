<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<html>

<head>
   <%@ include file="header.jsp"%>
    <link rel="stylesheet" href="main.css">
    <link rel="stylesheet" href="create.css">
</head>

<body>

    <div class="container">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-heading">
                    <h2 class="text-center">Welcome, Amigo!</h2>
                </div>
                <hr />
                <div class="modal-body">
                    <form action="" role="form">

                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
            <span class="glyphicon glyphicon-user"></span>
                                </span>
                                <input type="text" class="form-control" placeholder="User Name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
            <span class="glyphicon glyphicon-lock"></span>
                                </span>
                                <input type="password" class="form-control" placeholder="Password" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
            <span class="glyphicon glyphicon-lock"></span>
                                </span>
                                <input type="password" class="form-control" placeholder="Password...again please just be sure" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
            <span class="glyphicon glyphicon-globe"></span>
                                </span>
                                <input type="text" class="form-control" placeholder="What country are you in?" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
            <span class="glyphicon glyphicon-envelope"></span>
                                </span>
                                <input type="text" class="form-control" placeholder="Email" />
                            </div>
                        </div>

                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-success btn-lg">Submit</button>
                            <a href="index.jsp" class="btn btn-primary btn-lg" role="button">Back to Landing Page</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>



    <!-- /container -->
 <%@ include file="endBody.jsp"%>
</body>
<%@ include file="footer.jsp"%>
</html>