package data;

import java.sql.SQLException;
import java.util.List;

import com.tl.entities.Country;
import com.tl.entities.User;

public interface UserDAO {
	public User createUser(User user);
	
	public User updateUser(int id, User user);
	
	public boolean destroyUser(int id);

	public User isValidUser(String username, String password) throws SQLException;

	
	public List<User> index();
	public User getUserByID(int id);

	public Country getCountryByCountryCode(String countryCode);
	
}
