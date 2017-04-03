package data;

import java.sql.SQLException;

import com.tl.entities.User;

import services.UserService;

public class LoginDelegate {
	private UserService userService;

	public UserService getUserService() {
		return this.userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public User isValidUser(String username, String password) throws SQLException {
		return userService.isValidUser(username, password);
	}

}
