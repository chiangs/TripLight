package dao;

import com.tl.entities.User;

public interface UserDAO {
	public User createUser(User user);
	
	public User updateUser(int id, User user);
	
	public boolean destroyUser(int id);
	
	
}
