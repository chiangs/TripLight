<div id="main-body">
	<div class="container">
		<div class="row profile">
			<div class="col-lg-3 col-md-3 col-sm-12">
				<div class="profile-sidebar">
					<!-- SIDEBAR USERPIC -->
					<div class="profile-userpic">
						<img
							src="${sessionUser.photoUrl}">
					</div>
					<!-- END SIDEBAR USERPIC -->
					<!-- SIDEBAR USER TITLE -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">${sessionUser.username}</div>

					</div>
					<!-- END SIDEBAR USER TITLE -->
					<!-- SIDEBAR BUTTONS -->
					<div class="profile-userbuttons">
						<form class="formWithButtons" action="createPost.do" method="GET">
							<button type="submit" class="btn btn-success btn-sm">Post a 
								Review</button>
						</form>
						<form class="formWithButtons" action="viewPost.do" method="GET">
							<button type="submit" class="btn btn-info btn-sm">My
								Posts</button>
						</form>
					</div>
					<!-- END SIDEBAR BUTTONS -->
					<!-- SIDEBAR MENU -->
					<div class="profile-usermenu">
						<ul class="nav">
							<li class="active"><a href="userMain.do"> <i
									class="glyphicon glyphicon-home"></i>Overview
							</a></li>

							<li class="active"><a href="updateUser.do?id=${sessionUser.id}"> <i
									class="glyphicon glyphicon-user"></i>Account Settings
							</a></li>

							<li class="active"><a href="logout.do"> <i
									class="glyphicon glyphicon-flag"></i> Logout
							</a></li>

							<li class="active"><a href="help.do"> <i
									class="glyphicon glyphicon-flag"></i> Help
									</a> </li>
									 <c:if test="${sessionUser.adminFlag == 1}">
									   <li class="active"><a href="deleteUsers.do"> <i
									class="glyphicon glyphicon-flag"></i> Administer Users
									</a></li>
									</c:if>
									
						</ul>
					</div>
					<!-- END MENU -->
				</div>
			</div>
			<div class="col-md-9 col-sm-12">