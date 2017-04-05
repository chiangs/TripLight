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
                       <h3>Edit Post</h3>
                       <form action="updatePost.do">
				<label>Edit Place<input type="text" /></label><br/> <label>Edit Review<input
					type="text" /></label> <br/><label>Edit Date<input type="date" /></label>
					<br/><input type="submit" value="Submit Edits"/>
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