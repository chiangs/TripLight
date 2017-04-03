package data;

import java.sql.SQLException;

import com.tl.entities.User;

public interface UserDAO {
	public User createUser(User user);
	
	public User updateUser(int id, User user);
	
	public boolean destroyUser(int id);

	public User isValidUser(String username, String password) throws SQLException;
	
	
}
