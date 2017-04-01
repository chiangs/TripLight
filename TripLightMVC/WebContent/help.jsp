<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
    <%@ include file="header.jsp"%>
    
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/help.css">
</head>

<body>

    <!--Begin Navbar-->
    <div id="main-body">
        <div class="container-fluid">
            <div class="row profile">
                <div class="col-md-2 col-xs-12">
                    <div class="profile-sidebar">
                        <!-- SIDEBAR USERPIC -->
                        <div class="profile-userpic">
                            <img src="#" class="img-responsive" alt="">
                        </div>
                        <!-- END SIDEBAR USERPIC -->
                        <!-- SIDEBAR USER TITLE -->
                        <div class="profile-usertitle">
                            <div class="profile-usertitle-name">UserName </div>

                        </div>
                        <!-- END SIDEBAR USER TITLE -->
                        <!-- SIDEBAR BUTTONS -->
                        <div class="profile-userbuttons">
                            <button type="button" class="btn btn-success btn-sm">Post Review</button>
                            <button type="button" class="btn btn-danger btn-sm">Review History</button>
                        </div>
                        <!-- END SIDEBAR BUTTONS -->
                        <!-- SIDEBAR MENU -->
                        <div class="profile-usermenu">
                            <ul class="nav">
                                <li class="active">
                                    <a href="#">
                                        <i class="glyphicon glyphicon-home"></i>Overview </a>
                                </li>
                                <li class="active">
                                    <a href="#">
                                        <i class="glyphicon glyphicon-user"></i>Account Settings </a>
                                </li>

                                <li class="active">
                                    <a href="help.jsp">
                                        <i class="glyphicon glyphicon-flag"></i> Help </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- END MENU -->

                <div class="col-md-10 col-sm-12">
                    <div class="help-content">
                        <ul>
                            <h1>We're here to help!</h1>
                            <br>
                            <a href="http://www.therealdennis.com" target="_blank"><h3>Dennis Carrasquillo</h3></a>
                            <a href="http://www.chiangs.ninja" target="_blank"><h3>Stephen Chiang</h3></a>
                            <a href="http://35.165.49.7" target="_blank"><h3>Ehren Williamson</h3></a>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- /container -->
    <!-- jQuery first, then Bootstrap JS. -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
<%@ include file="endBody.jsp"%>
</body>
<%@ include file="footer.jsp"%>
</html>