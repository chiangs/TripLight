package data;

import java.sql.SQLException;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.sql.DataSource;

import com.tl.entities.User;

public class UserDAOImpl implements UserDAO {
	@PersistenceContext
	EntityManager em;
	
	DataSource dataSource;
	
	public DataSource getDataSource() {
		return this.dataSource;
	}
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public User isValidUser(String username, String password) throws SQLException {
		String query = "Select u from User u where u.username = :username and u.password = :password";
		try{
		User user = em.createQuery(query, User.class).setParameter("username", username).setParameter("password", password).getSingleResult();
		return user;		
		}
		catch(Exception e){
			return null;
		}
		
	}

	@Override
	public User createUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User updateUser(int id, User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean destroyUser(int id) {
		// TODO Auto-generated method stub
		return false;
	}


}
