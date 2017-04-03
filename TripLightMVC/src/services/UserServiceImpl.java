package services;

import java.sql.SQLException;

import com.tl.entities.User;

import data.UserDAO;

public class UserServiceImpl implements UserService {
	
	private UserDAO userDAO;
	
	public UserDAO getUserDAO() {
		return this.userDAO;
	}
	
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public User isValidUser(String username, String password) throws SQLException {
		System.out.println(username);
		System.out.println(password);
		return userDAO.isValidUser(username, password);
	}

}
