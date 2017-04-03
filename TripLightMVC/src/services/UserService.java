package services;

import java.sql.SQLException;

import com.tl.entities.User;

public interface UserService {
	
	public User isValidUser(String username, String password) throws SQLException;
}
